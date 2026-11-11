const { chromium } = require('playwright');
const issues = []; const note = (k, m) => issues.push(k + ': ' + m);
(async () => {
  const b = await chromium.launch();
  for (const vp of [JSON.parse(process.argv[2])]) {
    const W = vp.width;
    const pg = await (await b.newContext({ viewport: vp })).newPage();
    const errs = []; pg.on('pageerror', e => errs.push(e.message)); pg.on('console', m => { if (m.type() === 'error') errs.push(m.text()); });
    await pg.addInitScript(() => { const st = window.setTimeout; window.setTimeout = (f, ms, ...a) => st(f, Math.min(ms || 0, 4000) / 10, ...a); });
    await pg.goto('file:///home/user/Kimpro_1/holdem/index.html'); await pg.waitForTimeout(400);
    await pg.click('[data-cid=rose]'); await pg.click('#csDone'); await pg.waitForTimeout(200);
    await pg.evaluate(() => { const S = window.__salon.store(); S.bank = 500000; S.gold = 500; });
    await pg.evaluate(() => {
      window.__qa = { bad: [], hands: 0, last: '' };
      setInterval(() => {
        const T = window.__salon.state(); if (!T) return;
        T.seats.forEach(p => { if (p && (p.chips < 0 || !isFinite(p.chips))) window.__qa.bad.push('negative chips ' + p.name + ' ' + p.chips); });
        if (T.phase === 'result' && window.__qa.last !== T.kind + T.handNo) {
          window.__qa.last = T.kind + T.handNo; window.__qa.hands++;
          const a = T.seats.reduce((x, p) => x + (p ? p.chips : 0), 0), c = T.seats.reduce((x, p) => x + (p ? p.startChips : 0), 0);
          if (a !== c) window.__qa.bad.push(`chip leak hand ${T.handNo} ${T.kind}: ${a} vs ${c}`);
        }
        if (T.phase === 'bet' && T.toAct >= 0) { const p = T.seats[T.toAct]; if (!p || p.folded || p.allIn) window.__qa.bad.push('bad toAct ' + T.toAct); }
      }, 40);
    });
    const driver = async (n, mode) => {
      const h0 = await pg.evaluate(() => window.__qa.hands); let stuck = 0, lastSig = '';
      for (let s = 0; s < 20000; s++) {
        const r = await pg.evaluate(() => {
          const T = window.__salon.state(); if (!T) return 'notable';
          if (!document.getElementById('modal').hidden) { const p = document.querySelector('#mBtns button.primary'); if (p && !p.disabled) p.click(); else document.querySelector('#mBtns button')?.click(); return 'modal'; }
          const ban = !document.getElementById('banner').hidden;
          if (ban) {
            if (T.phase === 'result' && window.__qa.last !== T.kind + T.handNo) { window.__qa.last = T.kind + T.handNo; window.__qa.hands++;
              const a = T.seats.reduce((x, p) => x + (p ? p.chips : 0), 0), c = T.seats.reduce((x, p) => x + (p ? p.startChips : 0), 0);
              if (a !== c) window.__qa.bad.push(`chip leak hand ${T.handNo} ${T.kind}: ${a} vs ${c}`); }
            const bs = [...document.querySelectorAll('#bannerBtns button')], t = bs.map(x => x.textContent).join('|');
            if (t.includes('리엔트리')) { bs[1].click(); return 'reentry'; }
            if (t.includes('리바이')) { bs[1].click(); return 'rebuy'; }
            if (t.includes('로비로') || t.includes('왕국')) return 'over';
            bs[bs.length - 1].click(); return 'next';
          }
          const pre = document.getElementById('preRow'); if (!pre.hidden && Math.random() < .05) pre.querySelectorAll('[data-pre]')[Math.floor(Math.random() * 3)].click();
          const f = document.getElementById('foldBtn'), c = document.getElementById('callBtn'), r = document.getElementById('raiseBtn');
          if (!f.disabled && !document.getElementById('actRow').hidden && !document.getElementById('actWrap').hidden) {
            const x = Math.random();
            if (x < .1) f.click();
            else if (x < .35 && !r.disabled) { r.click(); const q = document.querySelectorAll('#betRow [data-q]'); if (q.length && !document.getElementById('betRow').hidden) { q[Math.floor(Math.random() * q.length)].click(); if (Math.random() < .3) document.getElementById('bpPlus').click(); document.getElementById('bpOk').click(); } }
            else c.click();
            return 'act';
          }
          return T.phase + '|' + T.handNo + '|' + T.toAct + '|' + T.street;
        });
        if (r === 'over') return 'over';
        const h = await pg.evaluate(() => window.__qa.hands); if (h - h0 >= n) return 'done ' + (h - h0);
        if (r === lastSig) { if (++stuck > 600) { note('STUCK', W + ' ' + mode + ' ' + r); return 'stuck'; } } else { stuck = 0; lastSig = r; }
        await pg.waitForTimeout(6);
      }
      return 'timeout';
    };
    const leave = async () => {
      if (!(await pg.evaluate(() => !!window.__salon.state()))) return;
      await pg.click('#leaveBtn'); await pg.click('[data-sm=exit]'); await pg.waitForTimeout(80);
      const w = await pg.$('#mBtns button.warn'); if (w && await pg.isVisible('#modal')) await w.click();
      await pg.waitForTimeout(80);
    };
    const safeClick = async (sel) => { const e = await pg.$(sel); if (e && await e.isVisible()) { await e.click(); return true; } return false; };
    for (const id of (process.argv[3]==='quick'?['n2']:['n2','n3','n5'])) {
      await pg.click('[data-mode=holdem]'); await pg.click(`[data-ring=${id}]`); await pg.click('#mBtns button.primary');
      console.log(W, 'ring', id, await driver(15, 'ring ' + id));
      await pg.click('#leaveBtn'); await pg.click('[data-sm=topup]'); await pg.waitForTimeout(40); if (!(await safeClick('#mBtns button.primary'))) await safeClick('#mBtns button');
      await pg.click('#leaveBtn'); await pg.click('[data-sm=sitout]'); await driver(3, 'sitout ' + id);
      await pg.click('#leaveBtn'); await pg.click('[data-sm=sitout]');
      await pg.click('#leaveBtn'); await pg.click('[data-sm=hist]'); await pg.waitForTimeout(40);
      for (const k of ['replay', 'summary', 'detail']) await safeClick(`[data-ht=${k}]`);
      await safeClick('#hPrev'); await safeClick('#mBtns button.primary');
      await pg.click('#replayBtn'); for (let k = 0; k < 5; k++) await safeClick(`[data-rs="${k}"]`); await safeClick('#mBtns button.primary');
      await pg.click('#helpBtn'); for (const k of ['guide', 'rules', 'limit', 'ranks']) await safeClick(`[data-rt=${k}]`); await safeClick('#mBtns button.primary');
      const n = await pg.$$eval('.seat:not(.empty):not(.s0)', x => x.length);
      for (let k = 0; k < Math.min(3, n); k++) {
        for (const t of ['attack', 'cheer', 'fun', 'recent']) {
          const opp = (await pg.$$('.seat:not(.empty):not(.s0) .avatar'))[k]; if (!opp) break;
          await opp.click(); await pg.waitForTimeout(20);
          if (await safeClick(`[data-tc=${t}]`)) { if (!(await safeClick('[data-it]'))) await safeClick('#tmClose'); }
          await pg.waitForTimeout(40);
        }
        const opp = (await pg.$$('.seat:not(.empty):not(.s0) .avatar'))[k];
        if (opp) { await opp.click(); if (await safeClick('#pfTag')) { await pg.click('[data-ti=rock]'); await pg.click('[data-tcol="#22d36b"]'); await pg.click('#tgOk'); } await safeClick('#pfMute'); await safeClick('#tmClose'); }
      }
      await pg.click('.s0 .avatar'); await safeClick('#throwMenu [data-chg=shark]'); await safeClick('#tmClose');
      console.log(W, 'after items', id, await driver(5, 'after items ' + id));
      await leave();
    }
    await pg.click('#mkTable'); await pg.click('[data-key=bomb] [data-v="5"]'); await pg.click('[data-key=rit] [data-v="true"]'); await pg.click('#mBtns button.primary');
    await pg.click('.room:has(.mine)'); await pg.click('#mBtns button.primary'); console.log(W, 'custom bomb+rit', await driver(15, 'custom')); await leave();
    await pg.click('[data-mode=aof]'); await pg.click('[data-ring=a2]'); await pg.click('#mBtns button.primary'); console.log(W, 'aof', await driver(15, 'aof')); await leave();
    for (const g of ['g1', 'g2']) {
      await pg.click('[data-mode=sng]'); await pg.click(`[data-sng=${g}]`); await pg.click('#mBtns button.primary'); await pg.waitForTimeout(60); await pg.click('#mBtns button.primary');
      await pg.click('#leaveBtn'); await pg.click('[data-sm=tour]'); for (const t of ['prize', 'blinds', 'rank']) await safeClick(`[data-tt=${t}]`); await safeClick('#tpClose');
      console.log(W, 'sng', g, await driver(150, 'sng ' + g));
      if (await safeClick('#bannerBtns button.primary')) await pg.waitForTimeout(80);
      await leave();
    }
    await pg.evaluate(() => { const S = window.__salon.store(); S.daily = { streak: 0, last: '' }; S.wheelLast = ''; });
    await pg.click('#bonusBtn'); await pg.click('#mBtns button.primary'); await pg.click('#wheelBtn'); await pg.click('#mBtns button.primary'); await pg.waitForTimeout(600); await safeClick('#mBtns button');
    for (const t of ['rank', 'me', 'game']) await pg.click(`[data-tab=${t}]`);
    await pg.click('#setBtn');
    await pg.fill('#setNick', '마담QA'); await pg.click('#setNickOk'); await pg.click('#mBody [data-chg=panda]');
    await pg.click('[data-st=sound]'); await pg.click('#sBgm'); await pg.click('#sBgm'); await pg.fill('#sSfxVol', '30'); await pg.click('#sTest');
    await pg.click('[data-st=notif]'); for (const id of ['nTurn','nBig','nChat','nItems','nToast','nVib']) { await pg.click('#'+id); await pg.click('#'+id); }
    await pg.click('[data-st=game]'); await pg.click('#gFour'); await pg.click('#gFast'); await pg.click('#gConfirm'); await pg.click('#gConfirm');
    await pg.click('[data-st=table]'); await pg.click('#mBody [data-back=green]'); await pg.click('#mBody [data-felt=navy]'); await pg.click('#mBtns button.primary');
    const st = await pg.evaluate(() => { const S = window.__salon.store(); return [S.nick, S.avatar, S.audio.sfxVol, S.opt.back, S.felt, S.opt.fourColor].join(','); });
    if (st !== '마담QA,panda,30,green,navy,false') issues.push('SETTINGS saved wrong: ' + st);
    console.log(W, 'settings', st);
    await pg.click('[data-mode=holdem]'); await pg.click('[data-ring=n2]'); await pg.click('#mBtns button.primary'); console.log(W, 'after settings', await driver(8, 'after settings'));
    const nm = await pg.textContent('.s0 .nm'); if (!nm.includes('마담QA')) issues.push('nick not on table: ' + nm);
    await leave();
    const ow = await pg.evaluate(() => [document.documentElement.scrollWidth, document.documentElement.clientWidth]);
    if (ow[0] > ow[1]) note('OVERFLOW', W + ' ' + ow);
    const qa = await pg.evaluate(() => window.__qa);
    console.log(W, 'hands checked', qa.hands, 'invariant issues', qa.bad.length, [...new Set(qa.bad)].slice(0, 8));
    [...new Set(qa.bad)].forEach(x => note('INV ' + W, x)); [...new Set(errs)].forEach(e => note('JS ' + W, e));
  }
  console.log('ISSUES', JSON.stringify([...new Set(issues)].slice(0, 30), null, 1), 'total', issues.length);
  await b.close();
})();
