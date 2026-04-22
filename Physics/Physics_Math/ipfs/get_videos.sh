#!/bin/sh
# get_videos.sh — Download and pin all UAP Physics_Math research videos via IPFS
#
# Usage: sh get_videos.sh
# Works on Mac (Homebrew) and Linux. Windows users: run in WSL or Git Bash.

set -e

# Install IPFS (kubo) if not present
if ! command -v ipfs >/dev/null 2>&1; then
  echo "Installing IPFS (kubo)..."
  if command -v brew >/dev/null 2>&1; then
    brew install kubo
  else
    echo "Homebrew not found. Install IPFS manually: https://docs.ipfs.tech/install/"
    exit 1
  fi
fi

# Initialize IPFS repo if needed
if [ ! -d "$HOME/.ipfs" ]; then
  ipfs init
fi

# Start daemon in background if not running
if ! ipfs swarm peers >/dev/null 2>&1; then
  echo "Starting IPFS daemon..."
  ipfs daemon &
  sleep 6
fi

echo "========================================"
echo "  Fetching UAP Physics_Math research videos"
echo "========================================"

# 'ipfs pin add' fetches the video from the IPFS network and pins it to your node.
# Pinning means your machine becomes a host — others can fetch it from you.

# ============================================================
# UAP Physics Research Videos (Physics investigation)
# ============================================================
# VIDEO: UAP physics research video — tweet 1912105612931932160
ipfs pin add QmXEEEvta7v98kkrHjujX6aZAdKhqr2KvV9hAUkJCgzXcy

# VIDEO: UAP physics research video — tweet 1912265554804527104
ipfs pin add QmeGjN7TQA8QJKyEjEahw1sXz9KemBswzSyTRtWc5Xynyz

# VIDEO: UAP physics research video — tweet 1912464551028690944
ipfs pin add QmaenWhMvqWMh6FhT1QqkPv2ZAVLVMeQsbiEzJookuqgXy

# VIDEO: UAP physics research video — tweet 1912464595727310848
ipfs pin add QmTp77qCahQowsB9EcRuMWcfHszLrxKmp7mh776Hx4HuyM

# VIDEO: UAP physics research video — tweet 1912529404363776000
ipfs pin add QmeNWT3eZ62wogvH3eeG8uWMD2de3nfvRc4K3WMZBX5gEm

# VIDEO: UAP physics research video — tweet 1912715675791159296
ipfs pin add QmQU9nhgkBt6SMw5VcCnHN3VvVojoGDGWxT1AQ8KNwdKJ9

# VIDEO: UAP physics research video — tweet 1912783496646651904
ipfs pin add QmVUgLiPecDb3pPrnLzupzcytF2iZY7LUYTcgxZLNUbwbQ

# VIDEO: UAP physics research video — tweet 1912831602868338688
ipfs pin add QmUHtMERjSeDAqAuEeJKZWXKVknzmXNSefh1Z9Z6Sca5Un

# VIDEO: UAP physics research video — tweet 1913007628550389760
ipfs pin add QmNtPdpGS9KAFM2Wew2eBqQ3A9zLKAiYYkcG61d46ZjAC1

# VIDEO: UAP physics research video — tweet 1913229859163402241
ipfs pin add QmZtXNG5fgq6H43MWa2dg5KKxCdxx9PyzRNqxMLNQ1TU7b

# VIDEO: UAP physics research video — tweet 1913486746995871744
ipfs pin add QmPUMRqHZNYzrA78KGiNC4tnqC87orErKgko8NZELzoLCg

# VIDEO: UAP physics research video — tweet 1913553119520440320
ipfs pin add QmZaydsvx4gQfABFpzzEV5RfAV4akZtsXDF6CmfnCT8qp7

# VIDEO: UAP physics research video — tweet 1913560796048904192
ipfs pin add QmWLnZ7Y43gNRkdDF6Vy3maq76M4ApjnrPxjNBFZT1oN8X

# VIDEO: UAP physics research video — tweet 1913570554428428289
ipfs pin add QmWSUfwtcukGrK6eWqnUn5rvdxnomkUr6kRfitKfmZwCWU

# VIDEO: UAP physics research video — tweet 1913570616609026048
ipfs pin add QmS77DtXKQ3qhmsBpT8fFrWi57JVFczhTsVHd8UwXDCrqH

# VIDEO: UAP physics research video — tweet 1913911071704031232
ipfs pin add QmTweQu5VzvmJkN3PxNjNhpCdxu6qAsT7kxUv3GPxYRu8z

# VIDEO: UAP physics research video — tweet 1913911119221280769
ipfs pin add QmZgPdhTshUjFtkWBrUdNgoaNQt6PTGQyzd9KArieu42S8

# VIDEO: UAP physics research video — tweet 1913946739662544896
ipfs pin add QmT926cutRQds2hkMtthWKvrAg4h1xUrbMewXhFDu4xiVK

# VIDEO: UAP physics research video — tweet 1913946810210746368
ipfs pin add QmPeTdo7VnyzVcjm82ojq1FKcivzeQ48vgyAb2wjkRR8J3

# VIDEO: UAP physics research video — tweet 1913946853445619712
ipfs pin add QmVUEqcp3ydk8SY5knYAgsiq1muGXba3Uj9FAVJCiDwkcL

# VIDEO: UAP physics research video — tweet 1914290740769042432
ipfs pin add QmQMhBvZWym3aGFLy62UcLfUbLiBzECFKAya1pmoUxZczm

# VIDEO: UAP physics research video — tweet 1914290934143188992
ipfs pin add QmTeCTGErjRtJf3heYwEbtiVjBaX8t9nmki1V4vR2fzpCY

# VIDEO: UAP physics research video — tweet 1914290978443411456
ipfs pin add QmUkEsFAGSWKKErhHTsRf3EP8Woq1vBBnjqMnoZ395Hjdq

# VIDEO: UAP physics research video — tweet 1914619776615505922
ipfs pin add QmUiBE6ff2YLi4RUL3zwzfA8hBcdGMVgihgVfUy2wC3UZE

# VIDEO: UAP physics research video — tweet 1914620216472166401
ipfs pin add QmWae5zk63t4mUhg2pFdgxwnKgmLSV1SZajutAE7Ache85

# VIDEO: UAP physics research video — tweet 1914620524761907201
ipfs pin add QmTQMh5ctxGMcnz69B1kZVuWVmQbkSRxYFHwhq2qLaya5v

# VIDEO: UAP physics research video — tweet 1914624838960078851
ipfs pin add QmeuEEGNLrCPVyoJvqpeWmbAiXztw2dKFLbnE2a2AUSRut

# VIDEO: UAP physics research video — tweet 1914659640278913024
ipfs pin add QmY82sGpza6UGFa794vJcStdMadg2fkZxRaHH2rozkxUCY

# VIDEO: UAP physics research video — tweet 1914659684906328064
ipfs pin add QmRJkYBL47g59SZCfBgGoCCnTCGuyNrvjzJPzQfn5MVGXu

# VIDEO: UAP physics research video — tweet 1914664247965171712
ipfs pin add QmeYCTzZSpjzswDsYViDA4v9JzKe5n2C3PeNxhUYzWdGNk

# VIDEO: UAP physics research video — tweet 1914664288897392642
ipfs pin add QmWACo45rBxEvqFiMbkC2HWZ9EomLUjMe9B6nPJKuRBX1F

# VIDEO: UAP physics research video — tweet 1914664329275928577
ipfs pin add QmNSkGostXeWbaAydjJg1fQoDQ5TRjre4UmkNwefXDr6s7

# VIDEO: UAP physics research video — tweet 1914869704390533120
ipfs pin add QmUAydhTYYRX1WQH5aLNhCreoM4S5JegVB2897o8dKRXx6

# VIDEO: UAP physics research video — tweet 1915205371091996672
ipfs pin add QmYJHXirFoPr2mUF4dtCVDUmFnfG6PfvShQ2gKPmDNY375

# VIDEO: UAP physics research video — tweet 1915359908901642241
ipfs pin add QmZD7pZcBJzcRisQ8dQywkgn6LYxvYUaCnmyKx3PJ4ybDX

# VIDEO: UAP physics research video — tweet 1915645568136994817
ipfs pin add QmREnX2TKrc3MZ7v4EgJJKARu14BzJFdXrnfyWdaPVenht

# VIDEO: UAP physics research video — tweet 1915646692306956288
ipfs pin add QmP3b1jokW77D921L9Tj6NsPHgFGWKrQydAQdyF9AiPu1Y

# VIDEO: UAP physics research video — tweet 1915717464387969024
ipfs pin add QmW4TnnH2a7oDnfeHXL4xVygNuMVi1DsgJ8fwnWQmDDh76

# VIDEO: UAP physics research video — tweet 1916093512992653312
ipfs pin add QmRZaBBh9cvh1vVAAbC7tGhrsU1WLXMSkYdkE3tDAosMUG

# VIDEO: UAP physics research video — tweet 1916095047227084800
ipfs pin add QmWSL8ah2BYt5sn81cqmYAxpPEjqjdnVyY3XNKNXacsPLG

# VIDEO: UAP physics research video — tweet 1916293139054350336
ipfs pin add QmVFVXJzxHrjRuBT9TxzwLzgyP2vZMMHGhhxe1bgeyF9iH

# VIDEO: UAP physics research video — tweet 1916293193240612864
ipfs pin add QmWdjiDtbiMVZkeYuRkK3KSwZr2T3WzGcneDeSYRrrCBaA

# VIDEO: UAP physics research video — tweet 1916451166030106624
ipfs pin add Qmb6vvN2zMRZL75XE4ScXVVe78jNjrW1pL76mCMQJ1sPss

# VIDEO: UAP physics research video — tweet 1916601587826618368
ipfs pin add QmSTSJQNaJfMxDsr7i9DJdPU489vJzK9ZXTpBiijCiq37L

# VIDEO: UAP physics research video — tweet 1916757043874299904
ipfs pin add QmNd95LWTMz35doorR7wPR5UnZfiLPRdtGvcKxWMe6D4oW

# VIDEO: UAP physics research video — tweet 1918277080154030080
ipfs pin add QmNdbLGyxSxJ63q2dtGo6WH63UGE5rjBDBQKHGCjueS7Gh

# VIDEO: UAP physics research video — tweet 1919302070332801024
ipfs pin add QmQhK1xmKQcGFFhA3fg3s9otsZk7MWTyn2WuDM4JjoZpNH

# VIDEO: UAP physics research video — tweet 1919363035447345152
ipfs pin add QmNcqXGnUfHG8cH63HoxirBCMHoEVjr2Q4Ww5r1tfYVkHB

# VIDEO: UAP physics research video — tweet 1919490490132791299
ipfs pin add QmQ9x9EksRNfvC7DsrqXFR2sCYoNtTARMd73tVoqMKC1zk

# VIDEO: UAP physics research video — tweet 1919592136674250752
ipfs pin add QmTU9tAW3fxY5sNR5Dj5Npy3AfLC9qWAmc9sNMza2QSZXW

# VIDEO: UAP physics research video — tweet 1919870920665284608
ipfs pin add QmaGWyu93mGmdeCEUgZEYurgyBvsUBCVcK37fGox3XZLYa

# VIDEO: UAP physics research video — tweet 1920044263381008384
ipfs pin add QmQDFeNNJx88L42wPzAxY1W1vTmdAjFbSKFe5qc9uGeps6

# VIDEO: UAP physics research video — tweet 1920044308943822848
ipfs pin add QmbW8oyx4FMM2VYbDFNib72oUQbf9cEC3rm43NLQsw4Dvx

# VIDEO: UAP physics research video — tweet 1920044351109156864
ipfs pin add QmShz31QVmXD8r93iCoZgjUrnBUeP3YvpZZnUL2bYb5gJh

# VIDEO: UAP physics research video — tweet 1920325869224022016
ipfs pin add QmT2JpNWWUHVmK8ky3m73v5UWvCdgUHWUBMH3fVKCasi4u

# VIDEO: UAP physics research video — tweet 1920734216028925952
ipfs pin add QmNN58oWSxrTkvPkiGXr2wBStRv7Gnvr8c41eFacHq66NG

# VIDEO: UAP physics research video — tweet 1920981233129189377
ipfs pin add QmPWgGcHW8JzShQ6r2HYWpqsxKdYKSDAPQu1zo3CEohbNg

# VIDEO: UAP physics research video — tweet 1920981297792774145
ipfs pin add QmfBpdRek8tuCunp9MnesRBvqHRSqwFWPPrzF6sWBc5QPq

# VIDEO: UAP physics research video — tweet 1921120807733911552
ipfs pin add QmP91wWYjVuj1P19c7stgAoH5uHnuC1424o3vpGxYr93AV

# VIDEO: UAP physics research video — tweet 1921331159574708224
ipfs pin add QmVzWVV2iEHcDHLx1ppvXQsVj4UAjnEU2zcJSSysSbTFco

# VIDEO: UAP physics research video — tweet 1922284712011431936
ipfs pin add Qma2MWu2wqJcWfE7pbYGbYWALFQ2r3WF9yvE5pJg8vScZH

# VIDEO: UAP physics research video — tweet 1922637416739057664
ipfs pin add QmTyyWnVThEvhwrsBJTppSicjZcAA1LyNFc4rE9xap4QDE

# VIDEO: UAP physics research video — tweet 1922666128960356352
ipfs pin add QmUNBu3Ksuw8CSudpPvbob3CkUVhcNGqERRQGxBkW9C4x5

# VIDEO: UAP physics research video — tweet 1923558674410229760
ipfs pin add QmcCshfta3MWcBUqLHrPJALts7hJojut35HHbQ1z7Kd26m

# VIDEO: UAP physics research video — tweet 1923558782346444801
ipfs pin add QmbJWJoCjns5nLZeLNovkgjNfJeAbTNxEAqkSs7b97vwC4

# VIDEO: UAP physics research video — tweet 1923616741801799680
ipfs pin add QmSc2Ln8ccpbyokdJxh7sskymZioQVNQQzXSgaubewnXpn

# VIDEO: UAP physics research video — tweet 1923735068603817984
ipfs pin add QmQcjxZeWhBCfWR8A9zBjcTPs5bPSWeWA9zgwJdjHDQRff

# VIDEO: UAP physics research video — tweet 1923907846153928704
ipfs pin add QmUnkGjGiU9FdLUuGpo42mhLEPuye5GEfZsFmbSHJiXVWH

# VIDEO: UAP physics research video — tweet 1924391502710513664
ipfs pin add QmT8zsop5PyhqZybSm7v2QE2cwxiNL6coiYVLs4E72VrTb

# VIDEO: UAP physics research video — tweet 1924392072468905984
ipfs pin add QmasoCcq9oSKLnyao7Jmg2CzpPSUDAU5jSy6QZnpXqr5TA

# VIDEO: UAP physics research video — tweet 1924392616814051328
ipfs pin add QmYLccePRdY5zMWdhjPWw3bJCqXUTzmV3cdXPPkF1v1EPj

# VIDEO: UAP physics research video — tweet 1924393015038050304
ipfs pin add QmW2ndoqikG9nvvDGZ6UdiLfTKQW8EL1HC8JiwzniPFYVL

# VIDEO: UAP physics research video — tweet 1924619947705286656
ipfs pin add QmbLBpimxoJS56a1VSL8mEJ8VG1ykSbNtwGKLWL7bU7EDA

# VIDEO: UAP physics research video — tweet 1925729290022203392
ipfs pin add QmeD6XRmtjT2e3PqurgWBCCYwgkvdcdeXEFjtn74nHJK2r

# VIDEO: UAP physics research video — tweet 1925816124744032256
ipfs pin add QmTzXv6NbipD6dVE8SsiAgUD3jK9wyTLQcZmyJUz2aLycz

# VIDEO: UAP physics research video — tweet 1925875814974758913
ipfs pin add QmTJby2UV8smErssjMTBAghaLnKBwREV1joZsnijUrsPh8

# VIDEO: UAP physics research video — tweet 1926181520990990336
ipfs pin add QmPjn8CBSqEf3zf6TqsD415spT2vohLQKnREg1TL6M6CVd

# VIDEO: UAP physics research video — tweet 1926228603248812033
ipfs pin add QmTa67aHNwJnrcmpHiGuRvtrAEhzt5vNp2zuDkHWvDfUiT

# VIDEO: UAP physics research video — tweet 1926417739813462016
ipfs pin add Qmcs76wqJiMcnvtJpEgeB6skYder1Xfhtk9mzX95gYxMVa

# VIDEO: UAP physics research video — tweet 1926423602494111744
ipfs pin add Qma58rDnD2HZBMUN8Ddp6JW3nW1Y6jN1NyAuVnL6budXe1

# VIDEO: UAP physics research video — tweet 1926605057438482432
ipfs pin add QmU1pmTYi6bnQyX9q4ruTZ5LajEuPy3P1YfuNAiLMpGpKF

# VIDEO: UAP physics research video — tweet 1926609637857538048
ipfs pin add QmfGKBiaZ8pZHJdHGRkK256DdTUzdNjg2vAR7ASWxBH1Ju

# VIDEO: UAP physics research video — tweet 1926628160096874496
ipfs pin add QmYSwpc7J3kubUfL3vKLDsBw1VS8bJNcsBYSmDrNU26ryP

# VIDEO: UAP physics research video — tweet 1926788493868457984
ipfs pin add QmSXLcfeDMYCiqfuhZkYGKBEm5LL8dv6sc7rvbhKE5akGN

# VIDEO: UAP physics research video — tweet 1926942523726921728
ipfs pin add QmfRsrLwcWbhA62APbpUUSod1Um5j5wJvjvnrrbZzCXEoK

# VIDEO: UAP physics research video — tweet 1927339091730817024
ipfs pin add QmR8BuqkqhtpHqcCzRUapQVC8tbripJsMq3342aAz6Pbc1

# VIDEO: UAP physics research video — tweet 1927503318328242176
ipfs pin add QmcjEmwAeyijTZzCK1WTPAkCyuiDZz5rx3rKSAfMX9vrZd

# VIDEO: UAP physics research video — tweet 1927585094572630016
ipfs pin add Qmee9J4PLoJaGrtPyW5fKW62hcbJ7MU23HxiFh3n9rYHJR

# VIDEO: UAP physics research video — tweet 1927892447029514240
ipfs pin add QmczN97bidgHtZEoBYxC5Nz9nMiTVc3kDrSkoYxea9okEJ

# VIDEO: UAP physics research video — tweet 1928225927152160832
ipfs pin add QmPd9WfgBwcFJTiYNKPsha3bfvtK6RxA72a2MiVggrknxx

# VIDEO: UAP physics research video — tweet 1928341317706469377
ipfs pin add QmXhKKQDdiH4ZV7GvSJrtYgPermBewj5sU5YfaR2n9MZYb

# VIDEO: UAP physics research video — tweet 1928355052219158530
ipfs pin add QmSSbH1Cu3TzQCxU5VH1B2pnNbd4R3umNfTutTMFDQpECP

# VIDEO: UAP physics research video — tweet 1928419557796089856
ipfs pin add QmeErZniTgqiWgqpbD44iJa7Q6WadtHdBckYVcQmZitrZy

# VIDEO: UAP physics research video — tweet 1928757562629042176
ipfs pin add Qmar2mkek9yozU5hGo8kxsWtW9z8aiWMUh9JUL6QeYNDn6

# VIDEO: UAP physics research video — tweet 1928793427992592384
ipfs pin add Qmeya275Hv3i2U3dK34jA4piVzvHW4cHBz6PkqCaDGrkxd

# VIDEO: UAP physics research video — tweet 1928793484007452672
ipfs pin add QmdYdNkuxTa25nwvgrrH22AXzVtxZCL2CcYMSdfFULbvug

# VIDEO: UAP physics research video — tweet 1928793551321874432
ipfs pin add QmTgHbpn7bZhVY4MK2vdNVsL1opwPxfQtA6cCooKsDoAjp

# VIDEO: UAP physics research video — tweet 1928793637833551873
ipfs pin add QmZPz3AGXrCoXpZ3EgdEYXSyABKXjr8xCuZX1KS3DRzJzJ

# VIDEO: UAP physics research video — tweet 1928965887698284544
ipfs pin add QmT8Egqba1uPfW7R76rQUGekKXf6FewUuWH4dbWMZJdQLY

# VIDEO: UAP physics research video — tweet 1929004725753753602
ipfs pin add Qmf5mk3uhJVRfDQX9VmbP8HruZTadWMp1awtdG7rpjfrpF

# VIDEO: UAP physics research video — tweet 1929005136090935296
ipfs pin add QmdAZk2pfepanoiaySuKCfULMaGCUjAPdsNmzVETZMYDEK

# VIDEO: UAP physics research video — tweet 1929011075997167616
ipfs pin add QmXMfk4XriLEDBq5AJcL3vU7149Qmowhjf9oXV7HtBrYmB

# VIDEO: UAP physics research video — tweet 1929054271649304576
ipfs pin add QmehM8HqHxm6MM47J1KVwsxRDMVQ32N6hZWVMnRyRqDRJR

# VIDEO: UAP physics research video — tweet 1930622545256185856
ipfs pin add QmXoYHjCp5hjZQGWCXnftYahqtA3SRjCNpzbm5XKJZUdub

# VIDEO: UAP physics research video — tweet 1931669099911987200
ipfs pin add QmYvUNkwJ77vcRU7uSsDE5PZEBTXT479op99BEwrnneDsb

# VIDEO: UAP physics research video — tweet 1932034603617009665
ipfs pin add QmPCPLzzP1JGL1LvR2xtoRqSRzVrwKwPs9sJWGxvhMYNJc

# VIDEO: UAP physics research video — tweet 1932759554468823040
ipfs pin add QmcDZwineYNNboWXpryt2oLx6KraFWukCR1Z5kpBcJYgKB

# VIDEO: UAP physics research video — tweet 1933291015823372290
ipfs pin add QmNhLd22cjRRtdBGCEMQw6jQCSW4Vjwn2cfeHvTFpKFibP

# VIDEO: UAP physics research video — tweet 1933725484875198470
ipfs pin add Qmb6cZfpiZmCsFdFVTeRFQHxzCrznRUJQVPE3VYw7KUsvQ

# VIDEO: UAP physics research video — tweet 1934028507883171840
ipfs pin add Qme8EK4HNuHdNkV4GnMA3suCgntT5VEi7XKcEtG1RFmAHV

# VIDEO: UAP physics research video — tweet 1934191685191507968
ipfs pin add QmToBjp2GhCXikq35ZoRniYBxkxjG27VkGspQXN81bci2E

# VIDEO: UAP physics research video — tweet 1934237709943570432
ipfs pin add QmW2z52LsetfLes53KGza82bgxjh6DwQgp4X2PBUKRPgwc

# VIDEO: UAP physics research video — tweet 1934367707153190912
ipfs pin add QmbdPcZZaiLdZQEQcSAi1YGZwtPBkK8JYkmzTcg1TedLqL

# VIDEO: UAP physics research video — tweet 1934517026632200192
ipfs pin add QmbsNvjBhSpFgsGcDXJmMK4o57YAbHJMqNJ2GFmHR78J8U

# VIDEO: UAP physics research video — tweet 1934832086625710080
ipfs pin add QmSQEgfvjKzYUVPTcT5QxzsFsCH8nE5S9mkvGyyphbH88s

# VIDEO: UAP physics research video — tweet 1935285683427622915
ipfs pin add QmTGjyRJR3Njo8a9ztJSNd46uvZHPsoHTHn1KqNJqsAWnj

# VIDEO: UAP physics research video — tweet 1935610801450070016
ipfs pin add QmVYcTeef72bQQcAVyViEKq13iJfimCv39YpRpADveJM5p

# VIDEO: UAP physics research video — tweet 1935842247334854656
ipfs pin add Qmenar9Z1UY1rJ7Ldmqm4XCLNSTNLTeoo2HwNsbeBRLCKC

# VIDEO: UAP physics research video — tweet 1936266616024473600
ipfs pin add QmPn1rTeZvuez7ucPn43BR9KJuivrpvxeJ6cJC3Ph4ZBrm

# VIDEO: UAP physics research video — tweet 1936367389240856576
ipfs pin add Qma7xF2hEoBUUisfmr5R6AisEup3C2q67ANiExSxS9znVk

# VIDEO: UAP physics research video — tweet 1936372506547388416
ipfs pin add QmPwniGzgXp6pkKyNtaTQdYHBudBAkMviakgE93fgmc4P3

# VIDEO: UAP physics research video — tweet 1936726468727595008
ipfs pin add QmRPdtTSxhH6SJ893PqkX5r5XUENMBs8XuAXn7aAQwX9w7

# VIDEO: UAP physics research video — tweet 1937003749333151744
ipfs pin add QmS2JQrpdK8aUAFZNACgskEkPGF3dhDLUcNQasgLR7UpLR

# VIDEO: UAP physics research video — tweet 1937071657853538304
ipfs pin add QmU9a1LG2dmLAE716dvYfy5fHsZAcV7ZxWYyrftzeEEH2K

# VIDEO: UAP physics research video — tweet 1938140068872609792
ipfs pin add QmeE6Q2xDq2WxJu17vjKXZKRAsg9gcLG8YPv2WaU7oYtCa

# VIDEO: UAP physics research video — tweet 1938745737891983360
ipfs pin add QmeP5fy1xiMNQoQ9km5aaCFc9VTgn3W2Qn5ebEqfBzgajV

# VIDEO: UAP physics research video — tweet 1938840644862066688
ipfs pin add QmcBSXfaPdLekNcMAuUshzDeoxdAP6e6km4xoFbEKHXTwX

# VIDEO: UAP physics research video — tweet 1938858872615075840
ipfs pin add QmUg3hMic5sw78XaiNizGYctVQkrPZPNDmJykkWVgPH5s8

# VIDEO: UAP physics research video — tweet 1938894248356515840
ipfs pin add QmUVzc7TW3kBh6m5uQuSvDmjdMNdhwJiSzhwVRSTT6eURB

# VIDEO: UAP physics research video — tweet 1938897890132312064
ipfs pin add QmUCSC3Tg8ZumWCkANkETufurTzwxkoGJ7yQzdSxhPGikY

# VIDEO: UAP physics research video — tweet 1939119558104883203
ipfs pin add QmUUdjGkteLCVL7MtCJDto5YhCWV4psDERoHK8CEn6pUYZ

# VIDEO: UAP physics research video — tweet 1939119585065627648
ipfs pin add QmbKV2kLGmsdyX5vKwXJjDFU6BK6v2UDtbnWa2ANS4ZXds

# VIDEO: UAP physics research video — tweet 1939120368838402048
ipfs pin add QmXo1rVgTzKVA3Kjy2NxbhxHAUmyckciuW6rS8wrYMwL87

# VIDEO: UAP physics research video — tweet 1939293307605286912
ipfs pin add QmSoxK7sUR6Ufg8e1ncn2A18mtnvjbZSVw8JGMsj8Z6GCG

# VIDEO: UAP physics research video — tweet 1939854669683298304_video_2.mp4
ipfs pin add QmPV2rJAYAbNghNUekmcGPEQDMndYzBpPUwjfezJy7Msd8

# VIDEO: UAP physics research video — tweet 1939854669683298304
ipfs pin add QmPV2rJAYAbNghNUekmcGPEQDMndYzBpPUwjfezJy7Msd8

# VIDEO: UAP physics research video — tweet 1940173495037485056
ipfs pin add QmYJkK4d6mRsp6Fegxj1RmCJm4As5qK483Y2iZ8JcCvotz

# VIDEO: UAP physics research video — tweet 1940266108163923969
ipfs pin add QmYUQ5t7qgKYoPwCiwiHTK2emksAsTiEQmye9GjLy7w6SC

# VIDEO: UAP physics research video — tweet 1940266140778762240
ipfs pin add QmZQsSpc4fVciwy2BRu9oND6bvmNiAoVs5FHD8o9FoFe3m

# VIDEO: UAP physics research video — tweet 1940337109832794112
ipfs pin add Qmctc8PDHoHWW7aN4dP67yQz29cpvrcxsJgEXf18nkUjwy

# VIDEO: UAP physics research video — tweet 1940527339504295936
ipfs pin add QmYdNfSJGWa6AYTFKWvYF3TJLGaYYjsAKZwqY8CPTaVvVM

# VIDEO: UAP physics research video — tweet 1940541470999457792
ipfs pin add QmVq59SiJQnqffLCDjFgY4TTfMPHQjcJvRRgzCbH6pxNr9

# VIDEO: UAP physics research video — tweet 1940693448664784896
ipfs pin add QmT66pNwJomdsgVURcCeokmRUWWEx9yjKrXWuqG6QfFAN9

# VIDEO: UAP physics research video — tweet 1940753632229572608
ipfs pin add QmVm87spAenry95UiLbSdCc8Zgpg4YcnAvFMHmKR1VoPzY

# VIDEO: UAP physics research video — tweet 1940911383069020160
ipfs pin add QmfAFNNk54jLDNHsmGsV79ZxrmfBnZUH9prMSLVvApbzqL

# VIDEO: UAP physics research video — tweet 1940969242138152960
ipfs pin add QmQKoBznZUkejW3ERtHmSoaBCRdAL9D7sYiUaensEzHxt3

# VIDEO: UAP physics research video — tweet 1941060816209395712
ipfs pin add QmSaCAJmke6HsAc5NkZcA647ogp5eM71CaiC53yHVkiEmR

# VIDEO: UAP physics research video — tweet 1941310585410551808
ipfs pin add QmNn9vwN35x359Bhb5kYCzyFwBY8aZtNc1JKTXszg3KtFJ

# VIDEO: UAP physics research video — tweet 1941312368438542337
ipfs pin add Qmcjgys7HYB3Q3ioq1PYhCdYoEkhCjUDcfh7cBckyhrDh8

# VIDEO: UAP physics research video — tweet 1941429443244838912
ipfs pin add QmTxVk6dRKedsmxoTKGrrPBFWZWXGwBdJbWcjzE45qCsD5

# VIDEO: UAP physics research video — tweet 1941499152179007489
ipfs pin add QmSPzgqfYUFjB8jcVvuk3K8PeRraS7Me91zA8JQDrXcmDG

# VIDEO: UAP physics research video — tweet 1941725328814329856
ipfs pin add QmQH6MpGCKqGNQNdG3cVg8K4xvhTPuBaQ1ik5n7w34vDbT

# VIDEO: UAP physics research video — tweet 1941725348170752000
ipfs pin add Qmc8rFbwTsZeKV4P7zySdGUKfetTzbwxzJBWSeTBXXP3Wd

# VIDEO: UAP physics research video — tweet 1941998621651533824
ipfs pin add QmcZMHQ9nhgav2KSqiFFMRKm36h5ZjuamRB6kTWQpsmEQw

# VIDEO: UAP physics research video — tweet 1942031494350036992
ipfs pin add QmZFa1LWjB547eoukhgUbH1ZmSgu5LMoyt8iqVmgQBAUtY

# VIDEO: UAP physics research video — tweet 1942033406667186176
ipfs pin add QmWjUkcqHSsidwaatAkJidH9dUsdECg65gn3aB8rDqpmfo

# VIDEO: UAP physics research video — tweet 1942536906681769984
ipfs pin add QmbFetXhWr9QrT9qrJENWpYfYfwU2Xfeu1e9zeK8oQ8pRE

# VIDEO: UAP physics research video — tweet 1942536927942696963
ipfs pin add QmczBPCRPBoCq9viANaLmc3M8qBdJ4SZ9EqeDWW2dmzY3t

# VIDEO: UAP physics research video — tweet 1942554539535585280
ipfs pin add QmSVqEM32ZuKqtDDtx1jcyyaBZYRsn2XpZBKUHfBQ4Dhxv

# VIDEO: UAP physics research video — tweet 1942706021102936068
ipfs pin add QmR4hqVMdy2syNa7NVzqvj5ggbs5okKggqm6xDVhN6UHWm

# VIDEO: UAP physics research video — tweet 1942712940169252864
ipfs pin add Qme7abwC7G3BzasgBT6bXQqCkDBQ3jVzuSvE5s5aXPSrZq

# VIDEO: UAP physics research video — tweet 1943082748287291399
ipfs pin add QmaDqSTjTak7eJjm6NjXPeQUwCFNVbVJyJi4iPYUVLcth5

# VIDEO: UAP physics research video — tweet 1943114592873553920
ipfs pin add QmREatACC9x4uLBYsx1QwSTfBKBRmSrZLxVGbGERLkBRQT

# VIDEO: UAP physics research video — tweet 1943838363595026434
ipfs pin add QmQqGtRqBL3VUoHCPmo8ce3yMVDcSDKYgLN22rHHLo9zN3

# VIDEO: UAP physics research video — tweet 1943926229218078721
ipfs pin add QmNZ2aGcwLxDnk5Dx5sirzGoGe8JF8wLgi42g3DQryxTQd

# VIDEO: UAP physics research video — tweet 1944285251141787648
ipfs pin add QmWPBJycx7iDpRaAvxXQ6Se2sd8WCXiuVn8Qv2asVYjAMQ

# VIDEO: UAP physics research video — tweet 1945035049575047171
ipfs pin add QmYwNfjC9GraeERWtr5jJgb9k3zPFL4Txzw78T37nDbmJQ

# VIDEO: UAP physics research video — tweet 1945035075034189824
ipfs pin add QmRQGnErQecg9VRqPBtXJX8v251bhFSubNm93x2tt8kVKF

# VIDEO: UAP physics research video — tweet 1945271580747014144
ipfs pin add QmYd9AWhPshVTGchbfF8NykGMDDQL9tWDXuS1rCg2CeUJ2

# VIDEO: UAP physics research video — tweet 1945531909028577281
ipfs pin add QmWRHwLwTwnNT7DbDdwqMYXQx1i3GjSdF8Bf3RME6LkX8G

# VIDEO: UAP physics research video — tweet 1945638282114539520
ipfs pin add QmWWeG1ztwaJnVPgjWxAX5dWH8EVvxjnGcMv4nbfeQj9DB

# VIDEO: UAP physics research video — tweet 1945639910221746177
ipfs pin add QmZHwGMtMxXhxmbLe2WRdhyjWtonsF9aeWETn5eedF4zL5

# VIDEO: UAP physics research video — tweet 1945754759043977217
ipfs pin add QmVSyuYxe8JCTDHFXXPpVL195dESxDa3Ld9uLrdPeuDUuK

# VIDEO: UAP physics research video — tweet 1945755387052888064
ipfs pin add QmYSKfupRWAsbAgZzKgeA4bKNpbMi4k8oo9CTZs7dsWmHm

# VIDEO: UAP physics research video — tweet 1946055004315373569
ipfs pin add QmZJxYbfuwiTMJYq8J4gnqZtuCi4aAETskMBEQezGMdyAy

# VIDEO: UAP physics research video — tweet 1946055062100271104
ipfs pin add QmQMfw6XGE2q5g8RMssJHpx9gDp5KHJDbVenK6cVtf7Qpa

# VIDEO: UAP physics research video — tweet 1946055082283311104
ipfs pin add QmdpRj68GXM9hRzS74MxiG8RnJvztAckA6oPVjpuzmkAFV

# VIDEO: UAP physics research video — tweet 1946781218105896960
ipfs pin add QmVz7W3CQnp9fNLi7hyxZunJkaGMkT6rWbSsbc3XFBfCfJ

# VIDEO: UAP physics research video — tweet 1946781678388797440
ipfs pin add QmQQeHtNGc56mkiiNsRbQREXUg2u7eQAFPUwRSYthTwt49

# VIDEO: UAP physics research video — tweet 1946782398110167041
ipfs pin add QmPeZonbKdrXWC5k6HHtSPTE5Nh6tdb2nbCCj2QBoRLduJ

# VIDEO: UAP physics research video — tweet 1947129299259015168
ipfs pin add QmaSDSVFiU6xXVH9Bip6vN2b4sUMnNZVuYGYLd6b5eYSgV

# VIDEO: UAP physics research video — tweet 1947129624921534465
ipfs pin add QmQECZo8Tm9xfwxoCwQxvUqjHwsxrzd9wjgMbiPcgpGLF5

# VIDEO: UAP physics research video — tweet 1947298128572665856
ipfs pin add QmWNmL3ChFaZtHmE5c7e1go9bvke3fKM357ojV6rNXtiv4

# VIDEO: UAP physics research video — tweet 1948914967396450309
ipfs pin add QmPVkNWYdXENTbF7ncz2toUyuNvcUd2aS2rnCHtB7vbW42

# VIDEO: UAP physics research video — tweet 1948944092647620609
ipfs pin add QmUB6dW5SkayVbvMHbaAWs1h3xQeTbfgdxZnbgTr4PE9DV

# VIDEO: UAP physics research video — tweet 1949605188337360896
ipfs pin add QmQiWYmBSApsG8AzpGESk78xyK4z4RfTJxYxCH5PSqoVUD

# VIDEO: UAP physics research video — tweet 1949620875743113216
ipfs pin add QmRvdxvNLMUadvmDZLPuQ88jbpqQF9t2Dj2yNrzvJNupKP

# VIDEO: UAP physics research video — tweet 1949622406672515072
ipfs pin add QmaUPCcwrTb55dw1Y4nz3Q3cz8AR6k62hhjkYmEiK292Nx

# VIDEO: UAP physics research video — tweet 1949961745340002304
ipfs pin add QmXjN2RNxkHRmBMfWTjwaPpo7hFp6xUh7CGYP9oW4nBr3G

# VIDEO: UAP physics research video — tweet 1949982280119668736
ipfs pin add QmSnELwx6Xpqy9cRNrrYpKAC8hNrkeZx5hokTawksh25Yh

# VIDEO: UAP physics research video — tweet 1950002872260935680
ipfs pin add Qmb4Mn4VovsXKUNJeZxCjPVKki7oUtt7gPMVgNX1nPQC8n

# VIDEO: UAP physics research video — tweet 1950320524095258624
ipfs pin add QmSckJSPy4cbupQxyRh2GVs6ERyhrFxvwDNGxcCTKzsj5Z

# VIDEO: UAP physics research video — tweet 1950755144062373888
ipfs pin add QmU4QL4EYE51zLFU9XLjrvxqKfyWLVyoBu8wA53bCXeoPp

# VIDEO: UAP physics research video — tweet 1950802628667162624
ipfs pin add QmcLYzCY5vETXz7vQxjxAEdpp5mbfchtJSsUMJd1xrwqgA

# VIDEO: UAP physics research video — tweet 1950802649944879104
ipfs pin add QmUpew3f5rVEugdMYWj3HK7M8vmDypVAJwU5kxw5wzJvrq

# VIDEO: UAP physics research video — tweet 1950815386682966016
ipfs pin add QmaZEQMPzsahR9aFdDXUbPmuL6vPJq9ffihk364bEhTbDe

# VIDEO: UAP physics research video — tweet 1951777776404684800
ipfs pin add QmYaMskdndo8DyzsFd8W8F6weXdSMCMtTBShAx2bByKtNv

# VIDEO: UAP physics research video — tweet 1951845927343525888
ipfs pin add QmXJ7BR43gTKaQ8eRjjcNJFoPQB8pS1JLwxrPzQCbRViwH

# VIDEO: UAP physics research video — tweet 1952197367056510976
ipfs pin add QmaQKzzQynHroy7vkfZZEU7rwNZ7CMVDHLNKiNcZVNjqUk

# VIDEO: UAP physics research video — tweet 1952830609715548160
ipfs pin add QmUDJAUTxjRUvmNbi66LtV2fiX7t44ZKjTZ9qnMYQv276a

# VIDEO: UAP physics research video — tweet 1953031310395736064
ipfs pin add QmTLLYoQsFXMNwMgerjpcRmzmmCMwCY1kgKBpN9YAwcgV7

# VIDEO: UAP physics research video — tweet 1953031353286705152
ipfs pin add QmSXyaACetaFaJ4eoHtpUchJxjrt2nnYLfR5mVGsZi4Eop

# VIDEO: UAP physics research video — tweet 1953766028711985153
ipfs pin add QmVoApbZfYs1F9kgt6AYUwgqWmasRHJX1wzZbgU1Ls63XD

# VIDEO: UAP physics research video — tweet 1953766050958651394
ipfs pin add QmQ7Ju86VDZpXSBLGuhZDdwjgv9CwsgYDj1DDixFs6Efg3

# VIDEO: UAP physics research video — tweet 1953766137692663809
ipfs pin add QmWDKMcJchdLvsWuL9SN1AnWn1V8dhxMuTuri4grDRMPG9

# VIDEO: UAP physics research video — tweet 1954092358477524994
ipfs pin add QmdXeQGXhpXSQ773F2hsY8S1gTS4wPVzdTRKsLX3GdtxWx

# VIDEO: UAP physics research video — tweet 1954093865771859969
ipfs pin add QmQPvnNsL4XYsK7gTh5d378f8PhwJEeQQ5HNphzTag7ftF

# VIDEO: UAP physics research video — tweet 1954443651003916288
ipfs pin add QmfKRpvuDfQsfDQ8KHEoKVpL6uPHXjasDksoNNcWofCmwS

# VIDEO: UAP physics research video — tweet 1954443677339934720
ipfs pin add QmarQsXT2dmo1GQ2WJC46LA7gjoB8ky1JEAG9vYMQYbZYf

# VIDEO: UAP physics research video — tweet 1954454763732598784
ipfs pin add QmbNeFVAnjN6Wr4uEGM2sSgVffKjGJdU9WdzDtPJF3rW86

# VIDEO: UAP physics research video — tweet 1954660018697158657
ipfs pin add QmR6WpUQfyFkRt1ZLmCjyd2wMJk6vVDvqWRvGLzrhotrci

# VIDEO: UAP physics research video — tweet 1954769617718849536
ipfs pin add QmRcb3j78jKyVS4zBbRqfxBP7S5dwMjZQSvs4LVATfkY9b

# VIDEO: UAP physics research video — tweet 1954859810610106368
ipfs pin add Qma9A79VM9UrWKMT83o4SR3GjhcQsYVDVz77dZC6qyT4ES

# VIDEO: UAP physics research video — tweet 1955044355808563200
ipfs pin add Qmb9g1fHYEwv2nNTAB3ViW4eVJfUpWsqEY5TGV9Gfp6jdQ

# VIDEO: UAP physics research video — tweet 1955176551290675200
ipfs pin add QmQbfkyTVxCGgFbYUAtzrwC9NrVRpb7twgRLfPLvCw7w8i

# VIDEO: UAP physics research video — tweet 1955254431001481223
ipfs pin add QmThgKsRKyD845rcnziGr5eVtrGurngBxbXyJ6RuCAZs28

# VIDEO: UAP physics research video — tweet 1955254508520607744
ipfs pin add QmdjujTnqybR3YSZk65pwDJwWWY8SHonkZHZzEvPT14eFQ

# VIDEO: UAP physics research video — tweet 1955254595778908162
ipfs pin add Qmbr8zJHvQA2V2XTuY6FibpqqmxcK48Yd69rYrKMtbL1Nw

# VIDEO: UAP physics research video — tweet 1955254816034422784
ipfs pin add QmRWsQ4ev9yV9UBe8EZMFzLE1DBDzu36q7oQ3QTXVrUdB2

# VIDEO: UAP physics research video — tweet 1955403085884661761
ipfs pin add Qme5JFG2SCeW5jsDRivN2ALd6NPsHrGQbnKEiUbtPY5s5J

# VIDEO: UAP physics research video — tweet 1955406945202163712
ipfs pin add QmPywxZyAWveJHQABXpKGe5pjipJzqeoM78CpqH4ss9upt

# VIDEO: UAP physics research video — tweet 1955415448201330688
ipfs pin add QmSn6bN7Kx5CW5JL1oBEPnbwGGQKV9LuSkmKPtKu7prLLn

# VIDEO: UAP physics research video — tweet 1955415468392714240
ipfs pin add Qmf9UEBWME9mNyMqvpjjX2HWP1J6CSbzC9zQeopqUQDjwq

# VIDEO: UAP physics research video — tweet 1955447627912552448
ipfs pin add QmahZoRGjcWwdGvYe2LtQeu5nJWEfDLyNYABJGeWApoTc2

# VIDEO: UAP physics research video — tweet 1955448646377541634_video_2.mp4
ipfs pin add QmWbs8wabbBwjaDqCRsBphJvQDMXZo3DfGzqiVXkSLc6Tf

# VIDEO: UAP physics research video — tweet 1955448646377541634
ipfs pin add QmWbs8wabbBwjaDqCRsBphJvQDMXZo3DfGzqiVXkSLc6Tf

# VIDEO: UAP physics research video — tweet 1955603013298802688
ipfs pin add QmcvFdEm9sXF27xhzMpxiAvUh498Q2gMBjy54qHWry3XwX

# VIDEO: UAP physics research video — tweet 1955603036644270080
ipfs pin add QmWAEgEekaBFeUumRMQJTpYAeoFyuDFLNZYmp7d8E9oGWT

# VIDEO: UAP physics research video — tweet 1955912888067219458
ipfs pin add QmboZ6GHjLFARiNiC9vErBZcyEonXTm8cGCvEtYrNR5dqQ

# VIDEO: UAP physics research video — tweet 1956109900087746561
ipfs pin add QmYu4WNDZGmDrsntqFKGSQH7dcQhpo7deDmE36F1awxW7K

# VIDEO: UAP physics research video — tweet 1956109917850624000
ipfs pin add QmR8ELH7wjMsCy7HxcMA1z7bNhH5CoG33KLnrqgnagA3h3

# VIDEO: UAP physics research video — tweet 1956140781414309894
ipfs pin add QmTs7u9HJGDLSrUsj8bK92Mmy2Z4ijWfacAGZkwos7m4Gu

# VIDEO: UAP physics research video — tweet 1956256697774956546
ipfs pin add QmPW6hmjiAkmMJ18LHkzjojJyNCr3hbwBXrckaDVXhieTk

# VIDEO: UAP physics research video — tweet 1956312560929792001
ipfs pin add QmUwRERmswsh1oB7CxJkmMvFsEmiYoTLueDUX69WR85VC4

# VIDEO: UAP physics research video — tweet 1956313988444442624
ipfs pin add QmbYE7HwjaEzJj2rmXS76X5Tzw9tzMQ54ufJ4xxy8H3Kuf

# VIDEO: UAP physics research video — tweet 1956329124328611840
ipfs pin add QmNrvWZrwdw9JaybH3rbnZvoocUjE8Y1N8ubom6hoKMn8n

# VIDEO: UAP physics research video — tweet 1956513852885213184
ipfs pin add QmcnAVyM9bFPum6tDk1SaCt9uoo2nbzTxxM5To3ySFAeYS

# VIDEO: UAP physics research video — tweet 1956513878655053824
ipfs pin add QmNermQd7as9bftAZg3v4hVxzuXCbhA6rVeuFAnerQyx6B

# VIDEO: UAP physics research video — tweet 1956516018417004544
ipfs pin add QmSeB2j6ugjUUyRHTv5NqpnbXTwgZvTuPLxruSLTq1rFhs

# VIDEO: UAP physics research video — tweet 1956613616867934208
ipfs pin add QmWDjqxHAtpFWTkJEL73vsqcxsNeodHYY6L17Brhrxu6KH

# VIDEO: UAP physics research video — tweet 1956621179403501568
ipfs pin add Qmd22Xw7mEU8CvJQH2D1dFyt3H91PNKanccCN91E2ewowa

# VIDEO: UAP physics research video — tweet 1956679545492529152
ipfs pin add QmcXDGLCo8Z7pkJ3MMDSoLzExk9eQgkCdMCHtshptFgHC7

# VIDEO: UAP physics research video — tweet 1956878594044809216
ipfs pin add QmPjm1FdTSgbbSUS6giKF9qgJT5ozjFAjahtmwzcZoHPwq

# VIDEO: UAP physics research video — tweet 1957293251477811200
ipfs pin add QmfBPCNzPC5v7Nn4fcb2Nc5EYjcHCF8FQCrfPbjD8K7sfG

# VIDEO: UAP physics research video — tweet 1957594842802061312
ipfs pin add QmSqiiRa1YXZz4we5yXWRM2wWycbdkDNd9SUENN5hVsJdS

# VIDEO: UAP physics research video — tweet 1957650245611057154
ipfs pin add QmNLryJrMsmfn1iCyYoQ2H8nXtBX9Rjb4kr9mme1vfq9rK

# VIDEO: UAP physics research video — tweet 1957650288187441152
ipfs pin add QmetrmaSL8KRvLV3EfQouvW3Zw2RFN2nNncX3PzfD48Xik

# VIDEO: UAP physics research video — tweet 1957650341903921152
ipfs pin add QmWmBVSiN6vhtguXbKdHueqAVpWFtJVaXS2KNhaz7AKtX5

# VIDEO: UAP physics research video — tweet 1957656516158451712
ipfs pin add QmdW4f3QGLvSRg4yLDNgBuhBt3tWJ8VHrpRb3upffTLrWt

# VIDEO: UAP physics research video — tweet 1958067924130017280
ipfs pin add QmbdqC6s8CcweaRxqGYmBNaj4hGyUtiZWQrdB62tNX4twA

# VIDEO: UAP physics research video — tweet 1958751809209868288
ipfs pin add Qmcfok9pohCfRgks4RtPjFJ9RZEQHZbFzty7aC513aD1uY

# VIDEO: UAP physics research video — tweet 1958792227670630400
ipfs pin add QmU3Xjsw9jN8mpmdov2DhEjqhS9UCSM5MREh6sgkZAzAvd

# VIDEO: UAP physics research video — tweet 1959403965109723136
ipfs pin add QmRSTGFRV1ziTFb4PEAwiow6Cqj1jtiFjr84yXHyEvAGYA

# VIDEO: UAP physics research video — tweet 1959423125181104128
ipfs pin add QmTtW5vSMTRyaPwV15w8JRt58B8PzoxKDUPZGDebHew3TW

# VIDEO: UAP physics research video — tweet 1959450870925713409
ipfs pin add QmQX2cm9Eky4Lh6QvS6iXsYE8Pxu7EyHF5YMCYsqgFyAJk

# VIDEO: UAP physics research video — tweet 1959450926298914816
ipfs pin add QmUL16QhdmPfFafteG1mr6fLuSjoLHPd9E7qFJB8FrCCrB

# VIDEO: UAP physics research video — tweet 1959450945341075456
ipfs pin add QmPPrEWUw8QXdFaigD9zuobKPCszKN3KQZJtsSC6mwGxfz

# VIDEO: UAP physics research video — tweet 1959566395798425600
ipfs pin add QmeR9Hko7KrCsehruHymUnmXYsfVArkJWdNBFfJf6hv8CN

# VIDEO: UAP physics research video — tweet 1960771745448910854
ipfs pin add Qmccu1KKmGTCNoxp8eN88TyzkBxK6cvm4Ezvk528DZwDjx

# VIDEO: UAP physics research video — tweet 1961300654665977858
ipfs pin add Qma9fNi2GGjJWykNN7qX7HQ74H3PwM1UwWyGuqxAs7r54h

# VIDEO: UAP physics research video — tweet 1961543589387014145
ipfs pin add QmcoWJGfgNEbkRAW1Qec3KDzDkmHfTp3rggsqfSB2j8yGi

# VIDEO: UAP physics research video — tweet 1961942943293751296
ipfs pin add QmbnxM6Sh2h1EhZhePX1QidEUgp6xN7vB7CaTbcdwedzHE

# VIDEO: UAP physics research video — tweet 1962132483002310656
ipfs pin add QmR98HeXjstmGqZmBKmYioY9nC6Z9PfELkwDeURtUZndiH

# VIDEO: UAP physics research video — tweet 1962332131767803905
ipfs pin add QmRvqWSnKpDopdCSSAC7teXwcsHGDBHYYeDhmZr6Hr4EDN

# VIDEO: UAP physics research video — tweet 1962347985930735616
ipfs pin add QmfLYydrwaL6eBLSb1oaMyQPv4EYbNQctxQAwYQ8mg5DUu

# VIDEO: UAP physics research video — tweet 1962456715863142402
ipfs pin add Qme1tiFhW8eSTjgE5u18KQNuDCoGJpVTumR9qoMgokHhC8

# VIDEO: UAP physics research video — tweet 1962688511813001222
ipfs pin add QmQJtnGS7VHxZj5MvwV6N336HzYxGdnEQNzrCfBnuomUWw

# VIDEO: UAP physics research video — tweet 1962708739225735168
ipfs pin add QmfYk4ZxqQPyeaC9kLJVACNsDKcQ3FWi7FUzG8wpx8tFvR

# VIDEO: UAP physics research video — tweet 1963008508653404167
ipfs pin add QmQQzfoBwp2VUVmVtPYVDb3qaf2yutRjJBX9tGCNtjzhQ9

# VIDEO: UAP physics research video — tweet 1963008525036339201
ipfs pin add QmUyebjdin7Zn8VUED1T8tDCEzJpGJGLG1fZA9LmiL4Ect

# VIDEO: UAP physics research video — tweet 1963186182797533184
ipfs pin add QmZHifmcunwHPeZusixFa6zfzDD7p2bdPjpdcHySrf2LPU

# VIDEO: UAP physics research video — tweet 1963247276434079744
ipfs pin add QmfRUk1U1Dk3A2yKFXmc6dYvZABW7ZGzTtasgNEZLrguN5

# VIDEO: UAP physics research video — tweet 1963370020148580352
ipfs pin add QmbHs4Ngbhx4Zxq5X9k9G4Zw1iTzZoB4ohuYsmJSfuZPFN

# VIDEO: UAP physics research video — tweet 1963618296579948544
ipfs pin add QmUbgo1CcjwhwmE254VC2EWdSwbvMWsQoDdDRJmSRvHNew

# VIDEO: UAP physics research video — tweet 1963911407789113344
ipfs pin add QmP5bknHTXonmUApFbEMRKrqZj1ejWg3GaUCZofbY4owTj

# VIDEO: UAP physics research video — tweet 1963916120316153856
ipfs pin add QmTkFoHh5Wwm2PBGx8tYYc72H745dnFLUM51DWXDu479hE

# VIDEO: UAP physics research video — tweet 1963916778595352576
ipfs pin add QmRECsJBRN7yDPvZV9UwkHrmDSuGZxiTtwUKa2w8gXGtyd

# VIDEO: UAP physics research video — tweet 1964076811551477760
ipfs pin add QmdLv4XoNVVLFgto5jTpshX3TbazyTYmKqHGhFWHDuFVT5

# VIDEO: UAP physics research video — tweet 1964079071182409728
ipfs pin add QmZjeL6e8FKJMmqh1KJgG4jXzSuAih8sGh7fVrnr2fT1GC

# VIDEO: UAP physics research video — tweet 1964084210630873089
ipfs pin add QmeHHUUr3ww7RRkUeJiNYW9DyhrQ3M8bRbMMwuFVojqY2V

# VIDEO: UAP physics research video — tweet 1964084490902626304
ipfs pin add QmZF2fwLTeimM95oJEF887f5fZPLc8jJtG5YZGB4qg3Jaa

# VIDEO: UAP physics research video — tweet 1964084699376340994
ipfs pin add QmSi13DyXj7MZLUc2LAfiMJzg5TTEBi3Kqs7D6eQf1Zfrf

# VIDEO: UAP physics research video — tweet 1964248354038435843
ipfs pin add QmP6BdLbrQ1qMxwTsXvpDvVYJhdKoUULyJgQmefzix1azG

# VIDEO: UAP physics research video — tweet 1964248373151821824
ipfs pin add QmSJ2UWjZbWjB69fJX8phBFrKbpkN3Kvv1mCw4S7q2n3kw

# VIDEO: UAP physics research video — tweet 1964836005359591424
ipfs pin add QmeVSMGVvqhVhB3DpYiVPEsYhzy1ipWxCLMELgufrkZsDi

# VIDEO: UAP physics research video — tweet 1964836861555474432
ipfs pin add QmUNVmgYeWph5Sjm6Nuvmw5SYbXN7T9vmovHGtK3QNLXzq

# VIDEO: UAP physics research video — tweet 1964863613530955777
ipfs pin add QmVt2TxPake8xKJcDwHakwD1vAnrvxdkXZmADKcG4wrmp6

# VIDEO: UAP physics research video — tweet 1964863652840062977
ipfs pin add QmQP9V5bVMEtQQpefQFcMahg3b9NkBpdmXThMFp65wBCpW

# VIDEO: UAP physics research video — tweet 1964863674977558529
ipfs pin add QmaGkjY4fwDKib68D3z7hDLM5KyYcip9wckDCGRjWy1uYq

# VIDEO: UAP physics research video — tweet 1964875730883682304
ipfs pin add QmVnwtLxSNJh2BXiwAoK7rgV8PJMkmuNoE5rXYKLHyiaLU

# VIDEO: UAP physics research video — tweet 1964912194107457536
ipfs pin add Qma8T2Wdt8HrG15MJjZmVbr2NCZ7QrYQ1pprLuLk85sZcf

# VIDEO: UAP physics research video — tweet 1964912403545804801
ipfs pin add QmbeBuK8VFckgT5h1iAg8n331eukSwZaAcM5Qp8QwPJ4io

# VIDEO: UAP physics research video — tweet 1964913091323502592
ipfs pin add QmYqFnuowSkLWMXi1wFNb5HUVynkCuLDy2be4FGe5T7Kgy

# VIDEO: UAP physics research video — tweet 1964996566814728192
ipfs pin add Qmdp3weUdYLmWsZsAHybiAzMiLPRWp71gRFkYktxbxZRac

# VIDEO: UAP physics research video — tweet 1965665493215498241
ipfs pin add QmaE71AL4cSzQfdcsmRr6uhCak4AfgWPYzyMKyNu3WFFDw

# VIDEO: UAP physics research video — tweet 1965936544059109376
ipfs pin add QmY55aViNXuUWPfEBXiwMcqkm2GPJCcCPf67WJKyU4eY7s

# VIDEO: UAP physics research video — tweet 1966038196808200193
ipfs pin add QmY6gUgpaoSmPiJYf5YEBfWsAddQSLtBwpzvEbTZXtAfmj

# VIDEO: UAP physics research video — tweet 1966452294603726848
ipfs pin add QmQJQAZAhWyctkiv1wwng53E5PMxCNzfPLMQZkbEffa8t1

# VIDEO: UAP physics research video — tweet 1966822722723606532
ipfs pin add QmavhgkHbNTjtNEfV8XCA4T2hvVwh9VeSRqMm6inns8ExF

# VIDEO: UAP physics research video — tweet 1966828494484369413
ipfs pin add QmTwAAQ6HczPTvuiN7vPfhLUkimJtjGYkdvF6PetV7ebJd

# VIDEO: UAP physics research video — tweet 1966828665024704512
ipfs pin add QmRQV3HDQU78eGmn8Gy8goyG7N8KQyL5R25QwZQHKwEP8v

# VIDEO: UAP physics research video — tweet 1966849762998841346
ipfs pin add QmQvkNSgT4ian66iuema6jcpHhFeDqcqY2bSLn1NG5tD3T

# VIDEO: UAP physics research video — tweet 1966849814777516032
ipfs pin add QmaUh1Yzptzoi3JDuvVByVLyYHxGSmsYKXjkBrYEGDdniQ

# VIDEO: UAP physics research video — tweet 1966849882691694592
ipfs pin add QmW7egQFvYJ9LTfMn25yGYVCRXjUbQxYHEiJdMiUAw53hy

# VIDEO: UAP physics research video — tweet 1966849984579739648
ipfs pin add QmbbjK838EdyQSTTuoSrV85Mh2Dm5kwR9Hju2uA45FkNfx

# VIDEO: UAP physics research video — tweet 1967150217704484864
ipfs pin add QmTxvkUUSmZ3YtFh3vDgUBBFKJ1LYS6tZZMatEi5oXSSVQ

# VIDEO: UAP physics research video — tweet 1967150248696131584
ipfs pin add QmZwQuJuuoTLCRjZU7ZsaLuxEARk17Jiq7ZPk3HjdwdEyW

# VIDEO: UAP physics research video — tweet 1967359086615556096
ipfs pin add QmdVpTR5CkZVHG383q9ouQ9E31Mz2DoHXZFG1YZY2tAg5B

# VIDEO: UAP physics research video — tweet 1967439755995660288
ipfs pin add QmNb8wLYyiavthWjVqJNzgxDTTuoNyFfjcMmLP4y9gfhZB

# VIDEO: UAP physics research video — tweet 1967441607168565248
ipfs pin add QmTow3RdsvjiZRLUWv48e1UBmrN4YFbbAmQNmLuCpPQuQy

# VIDEO: UAP physics research video — tweet 1967443308210495488
ipfs pin add QmSciHJXz789K6xw4RUvXR9M9BoFqA8RQwpZhWxA8nSSzv

# VIDEO: UAP physics research video — tweet 1967992827654324224
ipfs pin add QmTXMwCoHgehgxRb1BkX6wEtkMABWnfS4CVKRC5rzpNiZV

# VIDEO: UAP physics research video — tweet 1968592496738635776
ipfs pin add QmYqmHrzrwJyaAvxfAkdnmiCmCE14J8mfB3udwJhmpwtuo

# VIDEO: UAP physics research video — tweet 1968862743961980928
ipfs pin add QmcyvUDaEQjxHmLXWT4VdsqTpnxrb1QHz5Xp1XsCYmv24T

# VIDEO: UAP physics research video — tweet 1968945007999713280
ipfs pin add Qmf4C5Q2VZkcV7mH8dduwMWFubo4svspeJPpNtYAH8dXfe

# VIDEO: UAP physics research video — tweet 1969221708965167104
ipfs pin add QmZ1FTTbDJvRjqV4LKz3YC19hZAJC4GgHs5FeFrGxJTnyY

# VIDEO: UAP physics research video — tweet 1969363842544365568
ipfs pin add QmYsNLDvi4s6hifQwx8ivkjBGSVVWXwCuFpikoyMYHSFS9

# VIDEO: UAP physics research video — tweet 1970464668910231552
ipfs pin add QmdwwkeeajRWypuhTi48MacwusSVKKfxSeh5vCoMBmzzUm

# VIDEO: UAP physics research video — tweet 1971031656783020036
ipfs pin add QmWTha3E4RfsyNJ73pun4oHgpnAHfrP1ff9Zk4Ge5k4Z36

# VIDEO: UAP physics research video — tweet 1971040897677795328
ipfs pin add QmeScbgdYjwiLPKb1QY7dQCHfDBgY4misoJwBY2hP6mVsW

# VIDEO: UAP physics research video — tweet 1971327140307279872
ipfs pin add QmciBERj3YnSjJW1wFsdR7niqif2mWy3wAyn7s5xWwxGVG

# VIDEO: UAP physics research video — tweet 1971360840071933952
ipfs pin add QmZXEBXvtXqyKXAwBp33aiEk1Ckcf2pM33ZtDXhkTk8k34

# VIDEO: UAP physics research video — tweet 1971458110847057920
ipfs pin add QmceBHBS3AJYBypKngxrmLb2TZt1fBtSguzcVQAXkBzVLk

# VIDEO: UAP physics research video — tweet 1971539074201825281
ipfs pin add QmdmxB8P2aKsp1ujgT1LtLRJ1u76KRcVJH6ojfRfvizFWv

# VIDEO: UAP physics research video — tweet 1971704920643715072
ipfs pin add QmaFvVh1uYWeK3uAPKXfaq1Ms5STLZZWtyb8PRred3ewPq

# VIDEO: UAP physics research video — tweet 1971719896305401856
ipfs pin add QmbdWwjh9NHMtDWEnz28VJyP4tzHVorjYjfvDCK37rMM16

# VIDEO: UAP physics research video — tweet 1971783575566753792
ipfs pin add QmS9qtnUqvCVKkoqNnFXhGQabR7SN5iKm7Pm1kjDKkSuBf

# VIDEO: UAP physics research video — tweet 1971865152497897476
ipfs pin add QmaTxKMbrkcJPTxe61HjQP4s5cRBR2hSaXZPtmu1oKmiwi

# VIDEO: UAP physics research video — tweet 1971865181249851393
ipfs pin add QmahbcKCS7Fuyh6Pq9UG4HFGcPW9Sto8mdYJKtakXhqSWX

# VIDEO: UAP physics research video — tweet 1971922262543814659
ipfs pin add QmbRADM27QABWF2AH3Rc6zmpRkoYvVX6hexr1JFX2QTdjv

# VIDEO: UAP physics research video — tweet 1971922293426475010
ipfs pin add QmaygLofdtj4DU8zut3jhLfS5cnJmHxB5Y9TpYV2vXE5g2

# VIDEO: UAP physics research video — tweet 1972255361815261184
ipfs pin add QmSY5dHd26U1DSRnH3keaSf9QvVrMsPkCe745AaAucTxgm

# VIDEO: UAP physics research video — tweet 1972255391594733568
ipfs pin add QmejzUvXZCVZCy89WK4ztuVFCaTgaGv7FjkNhjNrCVkUwb

# VIDEO: UAP physics research video — tweet 1972967366024916993
ipfs pin add QmY7RNS641iJdw1WXaAmEiksURagfzeoGCNLCsy3Y4pSiK

# VIDEO: UAP physics research video — tweet 1974092957533057024
ipfs pin add QmQouxunm6kU8gS2NfdMhLFmWsXmpKXutettufv3PtPHXF

# VIDEO: UAP physics research video — tweet 1974260985230921728
ipfs pin add QmUPRMZYHTVrV11nK5DHNx2jzbJ4ieThLeTVUhEM7s5jYr

# VIDEO: UAP physics research video — tweet 1974620869084483584
ipfs pin add QmaoNWnP9caXPTEwrL4FJjwr58wd8DDH3ed8vArCWhMgCk

# VIDEO: UAP physics research video — tweet 1974622727786184704
ipfs pin add QmdBcHS2rWVbShc72RxLCf2xaxnBySQDGwES9RchimSrrP

# VIDEO: UAP physics research video — tweet 1974624649180069888
ipfs pin add QmeZcoJvzmxkc8cebqxeaPMiGg2uLu8Zr8F4qHMEnkJZAt

# VIDEO: UAP physics research video — tweet 1975157201011671040
ipfs pin add QmbcGB4EfTLa63hFEeibhZeH8dpeofvtJ1J15phbAKz4JY

# VIDEO: UAP physics research video — tweet 1975492158070398976
ipfs pin add QmYEqBgxDcR2DUmdNQUkcp4zyZQdN2CPAwshUFwuy7mBuV

# VIDEO: UAP physics research video — tweet 1975685004018724864
ipfs pin add QmQvZ3ujGiuF7ZJyfb5jYFmQYAdPKoqEGF98rPE9LqzVGy

# VIDEO: UAP physics research video — tweet 1975685874789851137
ipfs pin add QmUsf6Byfs5DVaJDhz8m8KchXanrpDDSsigPyxiDLj3QXw

# VIDEO: UAP physics research video — tweet 1975689334616694785
ipfs pin add QmQcpHYJbYQyCu3LhgrkiwfPQeCEw3K6v5eRm2NBHKWpZ5

# VIDEO: UAP physics research video — tweet 1975743680901488640
ipfs pin add QmU7ojDQDpWZTBbuKfSzWpsBMhnoK3T9EuAaGFa9JRenGs

# VIDEO: UAP physics research video — tweet 1975781678292598784
ipfs pin add QmZm8bWEc48k62UuWg7LvbZMSE1vqFm3piay6vNUaiQnR7

# VIDEO: UAP physics research video — tweet 1975817585783611392
ipfs pin add QmRQvXZADLjD2ujnwq6yz2tVkJvoo5FmxPvcEdFna3tQNS

# VIDEO: UAP physics research video — tweet 1976070736315088896
ipfs pin add QmRU6qMPubJWXJeKMnhBqD8YnuYDW4X1V1NooBfK3JjY4n

# VIDEO: UAP physics research video — tweet 1976075963135037440
ipfs pin add QmZJ5Zm3GogYP7qLoXZGrmtFaqUgf8zJFvS5qwNzDDCGbE

# VIDEO: UAP physics research video — tweet 1976075981111828480
ipfs pin add QmepDbc3teU3YwBC78hCXMDrwLbXezTEYxaLKbRyc7QdFi

# VIDEO: UAP physics research video — tweet 1976401610663505920
ipfs pin add QmNtyFtFwvdKsbyaCj3pz5MbrMmsnf1bwsy42w93F8vmTJ

# VIDEO: UAP physics research video — tweet 1976969574974472194
ipfs pin add QmRiPivMgTBEfhVyrmvt8QQDgN8YZJsJv4w7w7hh3nDYEJ

# VIDEO: UAP physics research video — tweet 1976969778192687104
ipfs pin add QmZTQVJCnEZrTxm9HrgbfdqkRhWL5Xmq1sDQssD3tZaUfw

# VIDEO: UAP physics research video — tweet 1976970101728690177
ipfs pin add QmezdSwJkGfo554JVdep5Jf2NqVerTLqyFVUMz2dbVhnRx

# VIDEO: UAP physics research video — tweet 1976970916849762306
ipfs pin add QmXbqqwxpqRCc9q44dmvLdSpX1jiCpzdgkJYCS7DJ49D4j

# VIDEO: UAP physics research video — tweet 1976982878732140548
ipfs pin add QmUBse1RwxMiX7Q7CngbM9HSEDp5L9L7dvihvpo2tL6Tts

# VIDEO: UAP physics research video — tweet 1977144236366774273
ipfs pin add QmRArvGGReTqvCLUvoH33sgnaKbBYjFZWk3SgMwicB6Nin

# VIDEO: UAP physics research video — tweet 1977544155573407745
ipfs pin add QmPcWUsF3kXVJBCqhapZef16NrDgycpqG9txEUeF1YCr1M

# VIDEO: UAP physics research video — tweet 1977545116039667713
ipfs pin add QmVSCiqj8Ep5JQTamPj1weDVfNf4RAQiBLyQxmwFESNnSe

# VIDEO: UAP physics research video — tweet 1977842470991060992
ipfs pin add QmTEbLUZMtKsGnmxrxYZUkrpbNdskZYuUMYdihbczWuc3r

# VIDEO: UAP physics research video — tweet 1978247170760572928
ipfs pin add QmZzQMR31dYkohQXbPWuNEsmcqH3mHF3r1G2JCGvLvN9sp

# VIDEO: UAP physics research video — tweet 1978449695967236096
ipfs pin add QmQczSKwcnrjFx26NdwTEef93xfgAErFauu56MXXAyncm2

# VIDEO: UAP physics research video — tweet 1978538817469693952
ipfs pin add QmZGmL5nKkeSW6qdWoShGVhpFKaREJMLjg9h8F1SaCUQ6k

# VIDEO: UAP physics research video — tweet 1978592098623590400
ipfs pin add QmSr6d39SkW1fqJqcenTRBTbbC63hmRravRPsAQowDZPtM

# VIDEO: UAP physics research video — tweet 1979718214926897152
ipfs pin add QmRJ231cTyK9FY2LaKMMWuTfXLyYUFpu3TjBAAAjetL6zi

# VIDEO: UAP physics research video — tweet 1979718688069533696
ipfs pin add QmR8D15PK4CdyXVDrmnX7sz4XRpg7jECWH81zTdFVdyMD7

# VIDEO: UAP physics research video — tweet 1980034876456759296
ipfs pin add QmYDUy7byCqu8ocsgr5hfeKty2CE7Y1Nmb1aWbUKJDHmSp

# VIDEO: UAP physics research video — tweet 1980839150103212032
ipfs pin add QmVjyaTgjzLDytihSdYLhqSF6pCMccmYMF4pWmKFRWmN7a

# VIDEO: UAP physics research video — tweet 1980840868627058688
ipfs pin add QmcWMurdtNrqHUNPQCHLjSkV639HfYCkwAJuDki4LzxCvb

# VIDEO: UAP physics research video — tweet 1980841108847382528
ipfs pin add QmUNDzxNepXiFtiwfWJck2iqNkpzkHsuG6q6YGWpG2kfc3

# VIDEO: UAP physics research video — tweet 1980841378843066368
ipfs pin add QmeNx3niS19PtHTa2Gzce9twPDhGpGuSN7KzauYvXRZjfX

# VIDEO: UAP physics research video — tweet 1980900427647397888
ipfs pin add Qmavnh9zSSFmiizofWvgvNFqWkfyKv2jH6pypAtnBsXdbJ

# VIDEO: UAP physics research video — tweet 1980904234498355200
ipfs pin add QmX6Bp1A9SgypdA7bKcvh3C7PwtkdkBS2VmL6q2Nq2rrgV

# VIDEO: UAP physics research video — tweet 1980913751478976512
ipfs pin add QmXzJhWh3SzLAiRDLik7qXdWZgGFe43usN7EUejk63a9gt

# VIDEO: UAP physics research video — tweet 1983827490171973633
ipfs pin add QmXWBKNvBKKmSLGBFh1zv8KCB7HrmRowKTFeQ44tzTHRTg

# VIDEO: UAP physics research video — tweet 1983827586053742592
ipfs pin add QmNdSsG66Mm7oaJW8w2hLDCW7sKV71cJaZG1iKQVYv16P1

# VIDEO: UAP physics research video — tweet 1983881187644022785
ipfs pin add QmRc4M3sL3QxwwVJ4eympYMH8RMy3M7bGfDV5Brm5FHGUi

# VIDEO: UAP physics research video — tweet 1984095569347014657
ipfs pin add QmNkKj97fG8UNgWf9PddtB7M72KdiqMUuC1zEUfUBcp8kp

# VIDEO: UAP physics research video — tweet 1984095599403397120
ipfs pin add Qmch4UiRFKRdmknGQb5z1sv8h6wWDfNQvsYMgboijYpXxx

# VIDEO: UAP physics research video — tweet 1984096176745099264
ipfs pin add QmNkiu8VmCrw6UVKUfk3ZjYyA9fg1ju5XrKgjTzBYgAYiy

# VIDEO: UAP physics research video — tweet 1984099637196943369
ipfs pin add QmSUxUiugWmSiW6PpKvEdJEoZvBVGUbEngocwnFffCpD2a

# VIDEO: UAP physics research video — tweet 1984100046661677063
ipfs pin add QmPoDvbNJ4Zob8iTSQgLNHTKi6ezzYvbDsNFdAomQD5dZz

# VIDEO: UAP physics research video — tweet 1984976738036891648
ipfs pin add QmPd9XuyFJk4j4E7FJS1mwMwBPYg2a88DjFpdzEoTTDg4b

# VIDEO: UAP physics research video — tweet 1984976763143999488
ipfs pin add QmbDQAH6mojWEP7LXd41vfJ577HzN1Xy3sgGKGgvAnhZ8K

# VIDEO: UAP physics research video — tweet 1984976886636957696
ipfs pin add QmVhqJ9ZnBgftVJfpS8S3kUqA9r8RBr9kUrF9rsxVovWGd

# VIDEO: UAP physics research video — tweet 1985113955854163968
ipfs pin add QmeErhDg7urH3cDox19qjbuyVpM8CSGi1jT2YWMLTTc992

# VIDEO: UAP physics research video — tweet 1985115126673133568
ipfs pin add QmZnMjJF4q3GC4YxpzMDL6RBy2N3bKtQtBMwyYaDjgu6cy

# VIDEO: UAP physics research video — tweet 1985574379523321856
ipfs pin add QmPqYAvSnXBHdoygDD2rZUYV9EhFu4wGuVKvTs2Apmshub

# VIDEO: UAP physics research video — tweet 1985852720725774336
ipfs pin add QmedstaVDXNTACzEy6thhN86LUyZ2i99HsJHZLvUpCdhNZ

# VIDEO: UAP physics research video — tweet 1986169807415484417
ipfs pin add QmUJrPsFL3nkpuuTtRJ2TnGHut69KVYvoEMQ7CqUDPpXeC

# VIDEO: UAP physics research video — tweet 1986180539611815938
ipfs pin add QmW9R9PVyCui8eKBczfapZvYzogUycAWbPy2K9apjL9a18

# VIDEO: UAP physics research video — tweet 1986925638901788672
ipfs pin add Qmdo1Y9RVCnR6rFWPcSmUryXeGkRcxEmcRt2pdLCbvcobH

# VIDEO: UAP physics research video — tweet 1986926570641235970
ipfs pin add QmWUNfZDhcJnXCjcoUN6gBGer7FgdxQCWQTXuDHQWedfJd

# VIDEO: UAP physics research video — tweet 1987610806469697536
ipfs pin add QmW9CKbuFk2zZz7abmXxDVy3xWpCMBYb4UYcy9hYq5DjfA

# VIDEO: UAP physics research video — tweet 1987845803218792448
ipfs pin add QmSggv15sGKHZN2GshKL64KtDFgcik9Un8AqFzSMqgeHCt

# VIDEO: UAP physics research video — tweet 1988189696242184198
ipfs pin add Qmc4rKTQXSTEp9BaUaa8cdLHRmvHAFbE1f6uNPdcFoqDx3

# VIDEO: UAP physics research video — tweet 1989087179822493698
ipfs pin add QmaPt2oUsc2R1xCnepMtFxfNSSM5Pyz39KBP3mBnh3R99V

# VIDEO: UAP physics research video — tweet 1989465309305274368
ipfs pin add QmTLdw1KUDTLfpGND99eChhpnDFDE72pAKZbfKdEqu9rhz

# VIDEO: UAP physics research video — tweet 1989931011082444800
ipfs pin add QmYUoeoT5VWu29qdM2A2zX43wPLYjwJUUnTynTdsZpevHr

# VIDEO: UAP physics research video — tweet 1990166755407433728
ipfs pin add QmRE4dhq7og4oFbRQTVqBaZBss4PSSaxZ7HQWLBe9SqGDB

# VIDEO: UAP physics research video — tweet 1990168681251471361
ipfs pin add QmabcQZ4i44h1JzwTaA8XiAAAq93cqkhXF2bwsCHjKjLTZ

# VIDEO: UAP physics research video — tweet 1990169263647432704
ipfs pin add QmR7uzFJPcrx5LSce2PABcZYMdJGfk32LeDoy3ZutoEjCc

# VIDEO: UAP physics research video — tweet 1990917386179129344
ipfs pin add QmcZocM2yh4YgvAqRxbDoqkBujTgCuBgNamxbE5oz36rUR

# VIDEO: UAP physics research video — tweet 1990929129089499136
ipfs pin add QmPxHoVgtwfqzGhNkyGouHFowbvRqMavTXGxk6Zr2PoP4a

# VIDEO: UAP physics research video — tweet 1990997596966694912
ipfs pin add QmTFtYks49oPGGGViWFAwfjF9inU9vCKYqTZpmziZykrw5

# VIDEO: UAP physics research video — tweet 1991043852808200192
ipfs pin add QmaB9QFLki3CQwCfr5S7U1yP3Ume2FmV46xDBeXyBjWo2e

# VIDEO: UAP physics research video — tweet 1991044646177550338
ipfs pin add QmPLyKn413umKJrmKuNSMqv4a3rStVVnGHsFWvV1NFMKVm

# VIDEO: UAP physics research video — tweet 1991295353111629824
ipfs pin add QmX18tRwm6RddajVNmGTJsAbr2BQY2Kdpba1o6fubCP5tM

# VIDEO: UAP physics research video — tweet 1991684283761864705
ipfs pin add QmbuwpKLYekpGetYySwXh7rVcTYEuJkja99Te9L45vwEb3

# VIDEO: UAP physics research video — tweet 1991715859124097024
ipfs pin add Qmcy4yundAAfrHmZor8rQa9EmDGSymDHeH7puBRYrrfPVX

# VIDEO: UAP physics research video — tweet 1992006576060903424
ipfs pin add QmZND1kxq9UJJr9y5XaFjz26XvufFaCwWgsJX3otPDMfna

# VIDEO: UAP physics research video — tweet 1992014793289687040
ipfs pin add Qmbw6us4YPnoHwfRZ5xHSF3tRbDF8ypbT9LFydd5Apu7iy

# VIDEO: UAP physics research video — tweet 1992043321234276352
ipfs pin add QmRiB5E5A37fKR77WPsHMTwFWky155cryEowv8pSA8ksAg

# VIDEO: UAP physics research video — tweet 1992043321255174144
ipfs pin add QmRFATGryKQUx7ysRMTC4YTAAs2UaBM6zvRpNbKg4DiLhH

# VIDEO: UAP physics research video — tweet 1992047160062541825
ipfs pin add QmbDzhNmrtzf6Hy4WJ7zr5nsAKTHuXUFfmKH9kkTAYKE9j

# VIDEO: UAP physics research video — tweet 1992419383667499008
ipfs pin add QmfFLuYB7L4tPg5WqX2riae99Nu9Pm4mcxWZBJb4MoWngX

# VIDEO: UAP physics research video — tweet 1992565401751027712
ipfs pin add QmT4zYw2M4VQjt7HE5DVvWv2Gr3oFGG2JwkwHF1nUzeKFH

# VIDEO: UAP physics research video — tweet 1992579295949258752
ipfs pin add QmX57EuEdR3sJUFtkWqVCE5KetzWfQ8KcpD3JRiAiitsUG

# VIDEO: UAP physics research video — tweet 1992722894875688960
ipfs pin add QmURzSmywdqUfPtdsDAPB3tQUKUsfuWBsoM1dAZhb6Rh3p

# VIDEO: UAP physics research video — tweet 1992723358082101248
ipfs pin add QmT13fVwqppZ5huuATd3uDQwczLm2ciMCDQmvqDPHkvwX3

# VIDEO: UAP physics research video — tweet 1993195153084100608
ipfs pin add QmZCC4HuDCJSGc6phD6KCDMJ65DWTsSoM6LqL4ms7isncH

# VIDEO: UAP physics research video — tweet 1993226114467282944
ipfs pin add QmfE4hgUidaQiCJtLKRTeHW3uySk9iHQzpKeiYYnMDzG3t

# VIDEO: UAP physics research video — tweet 1993678817228193792
ipfs pin add QmWuZ1S1xdghKJv388yKPxQpFeUn4U3qcKonZqZkNTTJ1E

# VIDEO: UAP physics research video — tweet 1993953244213805056
ipfs pin add QmPqnC6Ld3kvBqvqRoXXyQa7ptYmHhKEwBgskshuF31u2N

# VIDEO: UAP physics research video — tweet 1994169707616980993
ipfs pin add QmcwswPfVvqpoyrq69oEJDFnAWZhwA9DonQJyrRN5V4ZNt

# VIDEO: UAP physics research video — tweet 1994256631992135680
ipfs pin add QmRvA8v3nwQQ4jV4pLX5rdEHACvUW7AvVHbvMF2HJU5tu7

# VIDEO: UAP physics research video — tweet 1994362525299916800
ipfs pin add QmahVkU483XfGvLuvZLHByTQGTeXSZqTDYuJM6Yt7EBTFZ

# VIDEO: UAP physics research video — tweet 1994557100299882500
ipfs pin add QmXWMKdJ8buuRnpU24AAc98jo9LH7bjwHZu7YaC4EUFTeJ

# VIDEO: UAP physics research video — tweet 1994621991899598849
ipfs pin add QmfPEY9SQjqJEy37ENP5DeKoiQqQccvGobErsGSqVCmoWv

# VIDEO: UAP physics research video — tweet 1994943434201993221
ipfs pin add QmYTr1DFt7usMkRtBaTXdmDtVpL3mbtR4fbkBnfZaY6r8i

# VIDEO: UAP physics research video — tweet 1994946719365435394
ipfs pin add QmYbWmVRNqR5jEh2K84sKN6GCmWdmCNUzXoQGbjhGa4vjo

# VIDEO: UAP physics research video — tweet 1995467474893262848
ipfs pin add QmUKYVaKXhmfYJCZkAFSW44MvHc3Eb8L2V1qscV7wJiQer

# VIDEO: UAP physics research video — tweet 1995467501040472064
ipfs pin add QmRyhvdcYwSRMUFHyh57Md8sAL2TMteqNHrVgcV5YMZhAP

# VIDEO: UAP physics research video — tweet 1995658735965163520
ipfs pin add QmccMZuDZzJdy5gEEzczQizUyCnfV9kogmSr7M8Cd9ecqH

# VIDEO: UAP physics research video — tweet 1995658911228329985
ipfs pin add QmPTtFY1AF6mE2JcQvAgy5caWCQ4xyL3KxxAFSLGqKU9sd

# VIDEO: UAP physics research video — tweet 1995974851149135872
ipfs pin add QmPXEkzCsuaGi8jET1xJiVUjU2Fp7GFKcTt48LDhm36B5c

# VIDEO: UAP physics research video — tweet 1997083031614701568
ipfs pin add QmT9vqij4RaLLaDYUip7tsgmLviHzEjch9otgsBdrR8fuL

# VIDEO: UAP physics research video — tweet 1997211478819217408
ipfs pin add QmciqEeyHqkMYZM3UE2b8M8kFhU4YzqzFQSe9psEdTThwM

# VIDEO: UAP physics research video — tweet 1997212003702919169
ipfs pin add QmeiPr1BQJZZUCqzDXxCQv1mREfVrL1ANXzYUNfbUdUyFK

# VIDEO: UAP physics research video — tweet 1997212266551468032
ipfs pin add QmQtDQtUoRXUZ7MxkjmLGTQpjw6uFfySaBQqhcJG5r2dsb

# VIDEO: UAP physics research video — tweet 1997258262782357504
ipfs pin add QmQQacqZFSig4BdfXMnfJGAxdC1fik6e7yRQrUZYV3ttqa

# VIDEO: UAP physics research video — tweet 1997258284475256832
ipfs pin add QmcR67YGpGjV4sH6EehpaQQ1Gfq381kecUCpxaNoih9aN9

# VIDEO: UAP physics research video — tweet 1997259301308817408
ipfs pin add QmbGvdUBWw5HqaacUsXVDCxXFtCwwp4XNfgboS5TydhVJX

# VIDEO: UAP physics research video — tweet 1997475959013085184
ipfs pin add QmWAjkFNjrzZNatUunpi8RkjgvZJBH9xHrersbAaHxcZ7n

# VIDEO: UAP physics research video — tweet 1997883367304667136
ipfs pin add QmRWyUB8cgTG5B9fpefJzq34oZ4DqLymKz7hZJbzofrdnW

# VIDEO: UAP physics research video — tweet 1997883390377512960
ipfs pin add QmTbfKQ9zp6Y4AVWsqKVWNEg57W96mF8tnGdg4LUcayizx

# VIDEO: UAP physics research video — tweet 1998223775410929664
ipfs pin add QmTnM3vRaLbKXWGFF1bxGAwG35wEWodJtecZ2gMEkn82pH

# VIDEO: UAP physics research video — tweet 1998499368022986752
ipfs pin add QmXLvPLxd3J2R9Q7G8C6DxcViaDBp8oLQGLtqmvUzS7hGA

# VIDEO: UAP physics research video — tweet 1998502143406518272
ipfs pin add QmSsy59vXadygxs848jK6TU21WWZWYtygfWzJbbho7cMQF

# VIDEO: UAP physics research video — tweet 1998504726581989376
ipfs pin add QmNZwoTdSU4GQyRNAo1hyNvpBgupAvuwkmJH5qAdkd2wky

# VIDEO: UAP physics research video — tweet 1998542927191298048
ipfs pin add QmVn85t8xxpVjZR9e1vcBCSR9hE8z5vJqGJsUwM7HSQmfJ

# VIDEO: UAP physics research video — tweet 1998585940084928513
ipfs pin add QmcHQz8Pp51RiSqtdwegsYmY3wWf6YsJX7k63CZLEXe9FP

# VIDEO: UAP physics research video — tweet 1998629923850956804
ipfs pin add QmNPXGuka1zPPh2QKFFr5RuW6ngpzkKewUoYytjmvxXg17

# VIDEO: UAP physics research video — tweet 1999229718110044160
ipfs pin add QmWHmuRBHWVBpAjczpSVumYymRXgWM4YyWfjezzbRzc7PU

# VIDEO: UAP physics research video — tweet 1999229849639223296
ipfs pin add QmVw2FyhihTXvKea8ie7PqS7uSHnMPiCLFNHpdXjJ9RPaf

# VIDEO: UAP physics research video — tweet 2000394455019368449
ipfs pin add QmRcCFaL51Bxnmt383r2etuB3UoMFNhZX2ySZcrdsgAEnT

# VIDEO: UAP physics research video — tweet 2000605356297236491
ipfs pin add QmVTciyWeGUdQBhY65zZbCTm1VZMFRZJtkkibYVpVnyehq

# VIDEO: UAP physics research video — tweet 2001057179789574144
ipfs pin add QmbtcsTz63Zx3EmxzFebUVH2H7e4gi1sMbGdnMQRVvWUJc

# VIDEO: UAP physics research video — tweet 2001574820505620480
ipfs pin add QmNZU19Wz4nFV72xSjTkcZxZyn4xQEBz3TEPnNegSAc2Gv

# VIDEO: UAP physics research video — tweet 2002128875002998786
ipfs pin add QmSRP94DYdwQn2gBx7BhXwZ8sV8MbjAmRdfgZEyaW9XnpE

# VIDEO: UAP physics research video — tweet 2002128932087476229
ipfs pin add QmPvCuaiYE5rcDN8EYYJm6GvpRVgpoHTMwJ46WuS8fVB9p

# VIDEO: UAP physics research video — tweet 2002128987397763077
ipfs pin add QmPAZ5kKKSQYWNBCbmE8jYRFRxqpqTRhGn9NBEoRGLVF92

# VIDEO: UAP physics research video — tweet 2002587562477801472
ipfs pin add QmPpRijTxzvKAzVHFojKZDUogGfS9WXEtcjyne3wsc7pZd

# VIDEO: UAP physics research video — tweet 2002838166592724992
ipfs pin add Qmb8jdtW9hHZSzqym4FqT6sk1i67bwJ32A7Pq2TkQN1Jhf

# VIDEO: UAP physics research video — tweet 2003225796304076801
ipfs pin add Qmah3ahid32abzQPue8KN53dQ8thNroT8vDuC98EBsHfj6

# VIDEO: UAP physics research video — tweet 2003282774070079488
ipfs pin add QmVtzxynNLVQf4Pa66n7hYJF2RjBoDt6U4hj2XuD3j36Hh

# VIDEO: UAP physics research video — tweet 2004064235526225920
ipfs pin add QmRm1V5Xhf2tQ9yWFFArd2Cz1ZUdswrtpvXG7fudM795f9

# VIDEO: UAP physics research video — tweet 2004486154817798145
ipfs pin add QmQWpJSCN2dpash3yYhLzfFgc3RAE4SNRd38YQX4Uq3hkE

# VIDEO: UAP physics research video — tweet 2004779233978318855
ipfs pin add QmdX6NSG6zgWiFwtT1jjL7fonq13NCcAsFVUTByYEHUtDU

# VIDEO: UAP physics research video — tweet 2005825302480707584
ipfs pin add QmVRG9ZczpxrAGHJRcbeagkpRVbwyuKWB55Nk41bw8FF4N

# VIDEO: UAP physics research video — tweet 2005885231849693184
ipfs pin add QmQe8UBEGrvdj7zQfJhwUc2FwkEEY4zp8dUNP6KwbuDQeg

# VIDEO: UAP physics research video — tweet 2006312124747026432
ipfs pin add QmQ4pMLXMTHy4yHX3jhYPHjRPmNrayDw32vBL5VuK9qJYr

# VIDEO: UAP physics research video — tweet 2006312124751163392
ipfs pin add QmWscmV9GYhL1NnXaS7BXEm59DUncUzSCNauHvkfDp7yJS

# VIDEO: UAP physics research video — tweet 2006312428892786688
ipfs pin add QmP85RQXZGzqTUrH38QdcwYCJ1Cw39Mu9qkgybazzA7EzG

# VIDEO: UAP physics research video — tweet 2006484741005127683
ipfs pin add QmNjjejo85eHZX8R5iUjMeLvSED9F74MRm5SZq25sZTPAJ

# VIDEO: UAP physics research video — tweet 2006502846406209540
ipfs pin add QmXdCADuZFodfNSBC7FcA6vY2i2rv32yze5sZmQ7HgmvKn

# VIDEO: UAP physics research video — tweet 2006544917359923200
ipfs pin add QmPi6U3EYDjUyXzkAFCV5WrrEA63cPdWRqmpadFDBebx5S

# VIDEO: UAP physics research video — tweet 2007699282548404229
ipfs pin add QmUHnsrsMaD428RLA71PZt3mKSxMikKwF2rEsQsa1iRwBZ

# VIDEO: UAP physics research video — tweet 2007747945261940736
ipfs pin add QmaRKm6HZ2omyp1LQafLDAgqcBGvgGtDGL24n5tZY22iwm

# VIDEO: UAP physics research video — tweet 2007971058230644737
ipfs pin add QmWAPL38S9jC3JW5FeSKR5q14pPmqfCT2u2mPRRW7RFh4M

# VIDEO: UAP physics research video — tweet 2007980566105460736
ipfs pin add Qmcdq3esmU982uemesBe1kLfmJvJ6WSRFc8qKmJwTmT6Yq

# VIDEO: UAP physics research video — tweet 2008289939608444928
ipfs pin add QmUsDgyyXQbvx33RiK3ki3X3FFaHQPc4ix1L5vHF68FQJo

# VIDEO: UAP physics research video — tweet 2008291373678825472
ipfs pin add QmPBPsCJG9HLkDPajTAqTDxkrDZZNx12SbeEeZzAjXF5aM

# VIDEO: UAP physics research video — tweet 2008649354857549824
ipfs pin add QmSzm3wBvrhbGk16gbhs8pita6ysMzZVFphtQMXEBqpZbK

# VIDEO: UAP physics research video — tweet 2009736598255226880
ipfs pin add QmSsSZpwBY9hJcojYxaxV85XRJsH9xHPG3hHH4eots7WJW

# VIDEO: UAP physics research video — tweet 2010492913118298112
ipfs pin add QmQc86un9ofWgBtWQfeNf2BR2qVkLj7CnWH9n1tiNMNGuV

# VIDEO: UAP physics research video — tweet 2010494303974662144
ipfs pin add QmSm1L1vebZSHbMDvZsk2x1M3BAEZz8Hx2qz3crkHqRf1b

# VIDEO: UAP physics research video — tweet 2010507746630914048
ipfs pin add QmeLr1WQLNpYPTG18QU8VeHTd974shKHJDetHjvsPoB8mb

# VIDEO: UAP physics research video — tweet 2010653338162061313
ipfs pin add QmRWsnpjFFa6VicASpLxmWTo1c7Kdnqwt4iHgxrEVguN7G

# VIDEO: UAP physics research video — tweet 2010848838396043264
ipfs pin add QmWCBayH1h2CoiuoJRyPx6TawBXTV645PYLRz5PMXCXecN

# VIDEO: UAP physics research video — tweet 2010855161602981890
ipfs pin add QmUMmfhBGjyMmXb5ofn2ePmSj9UzbbuYmd7HUmTThhGwqm

# VIDEO: UAP physics research video — tweet 2010855197346820098
ipfs pin add QmWgsDLR6ar4Qgr4uY746c4e9Js89C62MbsTHo3dMwPFDy

# VIDEO: UAP physics research video — tweet 2011054752860422147
ipfs pin add QmZihd5zZRmAwg6sc9pSqofpjG3yfgJa7kfyDpRS6WGD9R

# VIDEO: UAP physics research video — tweet 2011341558927462400
ipfs pin add QmV2trXd2u3vm3kKKqvzjwY7RZwL4GdTfMZSshUspjT1Wy

# VIDEO: UAP physics research video — tweet 2011910529686876160
ipfs pin add QmfMvnv7bFwxfdEfgWbQTMk2DLRHVLyoNv19q3jtwVgYvU

# VIDEO: UAP physics research video — tweet 2012447728333381632
ipfs pin add QmTJLZHhASGQ88DhFAcTqSVnb955bkgDGPmeyRPHiSMZjd

# VIDEO: UAP physics research video — tweet 2012643728305905665
ipfs pin add QmSCgZU7pJeU7oaEut32YEZY8huMVjfgtEpshwRJcw3831

# VIDEO: UAP physics research video — tweet 2012993687685390337
ipfs pin add QmPaHasVHoquvnBTc33yTZBWgk3oxhzWJ9YVsipSFghSXk

# VIDEO: UAP physics research video — tweet 2013078137089740800
ipfs pin add QmeAYa93H3Gp4gGUMq9wo1zpBCVg7v7Bb9VZCmmLPdiZae

# VIDEO: UAP physics research video — tweet 2013192605786386432
ipfs pin add QmTmCFiH4bFvNT1xPfRHvuXLCmrVRmpP3dZ3ARraCNUhiD

# VIDEO: UAP physics research video — tweet 2013344453327495168
ipfs pin add QmWSU7j7RYRtXC1WAMB9TqQRt9UzrRanwfCfmGWEkh7ggn

# VIDEO: UAP physics research video — tweet 2013345040328691712
ipfs pin add QmTzdGLzt8nrKNw9EoL1MEzp2XkFs7w77rB7WqS5iCBn1E

# VIDEO: UAP physics research video — tweet 2013471192431112192
ipfs pin add QmUfDHQEjpHcnaw1PRe7mGXAkVEr5LgZeXM1v3HNorSVay

# VIDEO: UAP physics research video — tweet 2013536672592326656
ipfs pin add QmQWRUWEBrXdduisUCSYRGk51cGVLoBXeSYLoQw8pmTYbm

# VIDEO: UAP physics research video — tweet 2013539618147241984
ipfs pin add QmTqxLixgJydZqm8UxEYSBNnjgA7mxWrSiat9jvtc9Rg7G

# VIDEO: UAP physics research video — tweet 2013721118897508352
ipfs pin add QmTHceZVv8dop4gyd4dQXEiVrKYE8WaMqAw6z2tkZ1daNJ

# VIDEO: UAP physics research video — tweet 2013723251055407104
ipfs pin add QmREbFP3n87fcpJip6GqFqhSSMB64o52qZdjaPvmPsadm5

# VIDEO: UAP physics research video — tweet 2013727669431738370
ipfs pin add QmYNBj5BEhtamqhHrrwakBiaFV7gbWsperzYeA1EuHCBog

# VIDEO: UAP physics research video — tweet 2013829723600887809
ipfs pin add QmUMXVgGGLPNJCDPamxxYfKVSEekqK7a9X6LgrfNbQe4Zm

# VIDEO: UAP physics research video — tweet 2014075285935890433
ipfs pin add QmRdvTDyDKZkhaYGMwCfWhenJwMJPVJJCjTQUf36pYz9au

# VIDEO: UAP physics research video — tweet 2014078193758777344
ipfs pin add QmUq8w4F49Bx9CjoWd21LnGA7k3JGgjfaS49GTGX2QTMLb

# VIDEO: UAP physics research video — tweet 2014201279539773440
ipfs pin add QmYBgMYEdnkDqm94T6GU7ivS2cXC9UsPwHDdhiqzxH1Vnp

# VIDEO: UAP physics research video — tweet 2014201513506181120
ipfs pin add QmT2ntCActPo1FGEoS5h49bTWcZCztgwsZSwDdWPAi17jB

# VIDEO: UAP physics research video — tweet 2014594201829220352
ipfs pin add Qma63StJgDdKD7baGF4DvrJdrYLbA5xDULriuAzw5DzWMD

# VIDEO: UAP physics research video — tweet 2014598205225463808
ipfs pin add QmY3m1wvTRdsnXjytx7zJzGURCgGC9oUYQNhzxxfYeoUMr

# VIDEO: UAP physics research video — tweet 2014598785461284864
ipfs pin add QmezBtmCZCUVdS8xREvgp89jZrdjPbjJFoMXUkgujXz2gY

# VIDEO: UAP physics research video — tweet 2014806920683487232
ipfs pin add QmauGuedwrPB8L8HXvJeRzGokqGQHRHhiFgugJzazULUdx

# VIDEO: UAP physics research video — tweet 2014966308069376003
ipfs pin add QmV1WEtXDTZDhrf9XRQDYhRANAcm9ErUtPpS2anmRgK7r3

# VIDEO: UAP physics research video — tweet 2014969598613856256
ipfs pin add QmUjDvyH8BE2hagZtvHXLx3ACfaHgT7ZaHiGg6aeHxyUBL

# VIDEO: UAP physics research video — tweet 2014994659647590400
ipfs pin add QmctqaPpwDWVXekT2tY8PySfgEhK9qAWNWY81Wboqf6hTo

# VIDEO: UAP physics research video — tweet 2014995745141895168
ipfs pin add Qmc23ztVf7xqUTqmdYDByVXWZZfnwCqKFqGgHiHdxsj5f9

# VIDEO: UAP physics research video — tweet 2015153464507277312
ipfs pin add QmXiuncQLbgA24DK4r598risYojxXT3EG7RnFmdV7QdXwu

# VIDEO: UAP physics research video — tweet 2015205928992169984
ipfs pin add Qmex3BcwUqdXN4nkAuG8Ck79FEQLoCy2hQHKyH8h3tT5w9

# VIDEO: UAP physics research video — tweet 2015207878161059840
ipfs pin add QmXVp5bvPHviQLUtuexRqqZRuDi7sTQSqsN4s4MwK6zw3K

# VIDEO: UAP physics research video — tweet 2015212128488325120
ipfs pin add QmZsduApSFUrw2wYRPTnwex5LiLQA7GvNoMqCouaZrp6xP

# VIDEO: UAP physics research video — tweet 2015529702174478336
ipfs pin add QmW4iYRnP6AEhMzkTSVyKK8GzThebgai66UWyuKSTnc3oy

# VIDEO: UAP physics research video — tweet 2015686602870378496
ipfs pin add QmY3WmM7inV8wABWd7YSHpvW8rYAtZjJo9CyNy7bAYhmkR

# VIDEO: UAP physics research video — tweet 2015732981915410432
ipfs pin add QmWiWb2ncAJCFu2vSKKvTHdyJipV1qCyo4cBbKoLATW4sx

# VIDEO: UAP physics research video — tweet 2016044005918691328
ipfs pin add QmXGZGrXVoJ18cRNxFtPvjiZgYhgcCjMoQrDTX6UZHPYF1

# VIDEO: UAP physics research video — tweet 2016048562987991040
ipfs pin add QmepjYasy7cV9WVw4zRcmrsjU8Y5Fmm7dGYUnNxKtYS2JN

# VIDEO: UAP physics research video — tweet 2016049249029652482
ipfs pin add QmYcuZnAcdi7SjMpJ8DdyAf9EXH9F7XeBqmXkLAVtWQMtH

# VIDEO: UAP physics research video — tweet 2016052283222454272
ipfs pin add QmfQDVcDKnWn8wEXGowxChXEiSxLbqJbucPSwQLaC86oqV

# VIDEO: UAP physics research video — tweet 2017019623804456962
ipfs pin add QmZamJhBnz39ckEoBEjoSEz13Uu53s5F3hT44aaZytNoqJ

# VIDEO: UAP physics research video — tweet 2017404209285763074
ipfs pin add QmP9cEZvrxfwRaZmM2WqthMc3SrSjRF9gZ7u1qnpk8aU6g

# VIDEO: UAP physics research video — tweet 2017407455903551488
ipfs pin add QmR6NhwBCZ3ZrozUusdyUHQb2ZqHe9y82kEt3sTVnuaSpi

# VIDEO: UAP physics research video — tweet 2017453559894384640
ipfs pin add QmTpCbTbSrTk9vMVydy4g2tsQcevrHVqwRWATXTUzXeeHV

# VIDEO: UAP physics research video — tweet 2017808816407252992
ipfs pin add Qmd5DApRoQoBikSU781BKyd7feVf7AJm2FsDExgwLqQkmb

# VIDEO: UAP physics research video — tweet 2017866917693034499
ipfs pin add Qme4Vc6nSAyAnbJMHasvtKT5ogqDKbsFEZsX5mhJgkMpGu

# VIDEO: UAP physics research video — tweet 2017872609355116544
ipfs pin add QmdhnhRuGxG8Nu1NY6p93u3docXnigcZN3MVquTB5eTkDh

# VIDEO: UAP physics research video — tweet 2017880327830872064
ipfs pin add Qmctpnw4X9nhinanefcpxhBCLp7wnmW49PaRV7gZShbPiu

# VIDEO: UAP physics research video — tweet 2018428495270207488
ipfs pin add QmdXcFxo94yuGSWSEt93abNTE6wvt1jHYfNhusjEsgjmn4

# VIDEO: UAP physics research video — tweet 2018562767792533504
ipfs pin add QmfPkToMaeEpZCBFEz7ijLBmRSJfyA8hgKRMVDshpEyQH7

# VIDEO: UAP physics research video — tweet 2018894777127936000
ipfs pin add QmarQPjkzHCNVpSqLA5v9UVRAB3C2gFitdKreR39KVq6Sm

# VIDEO: UAP physics research video — tweet 2018897166006403072
ipfs pin add QmNPb7SEdW5WpNjRDBUG8iwYz9M2FgBBzKQwmvWyvhfmGT

# VIDEO: UAP physics research video — tweet 2018897183253348352
ipfs pin add QmXs5pubfmFH2h7HbdN2LAGsx4SFHZnKieiAK92weQUyBK

# VIDEO: UAP physics research video — tweet 2019000398586277888
ipfs pin add QmWeDf5nzZqpnPEnYmvQtiyHSPMaqvpdQU4WbLN12U3UtC

# VIDEO: UAP physics research video — tweet 2019001060967456768_video_2.mp4
ipfs pin add Qma9zp7TZzaLqLKpRtGT5ZwQLPExT1F9RijpVuxBFZqVXn

# VIDEO: UAP physics research video — tweet 2019001060967456768
ipfs pin add Qma9zp7TZzaLqLKpRtGT5ZwQLPExT1F9RijpVuxBFZqVXn

# VIDEO: UAP physics research video — tweet 2019229679966908419
ipfs pin add Qmed2E2SPfLaqD76T4FtrcwcVMVdNHuuX3hPRPuoWm7Gh4

# VIDEO: UAP physics research video — tweet 2019231432443645952
ipfs pin add QmawbsKZFW4vbQzQjcMRRKvszvtdkmUaBRkQxz5tTx2SsE

# VIDEO: UAP physics research video — tweet 2019231456686665732
ipfs pin add QmPz3WZrUd1AVK25EHd2nUGCETGimMTEWPcLSqMADeYPLc

# VIDEO: UAP physics research video — tweet 2019231482276126720
ipfs pin add QmRMSA5VtovEaawibEWDcKfRL72ftgRAHCP3ckKmANpUhH

# VIDEO: UAP physics research video — tweet 2019232998710038528
ipfs pin add QmQ4MfK15HwhoPDTw4XXYc5mdCibisw1oc1VxtvLMY3Rvp

# VIDEO: UAP physics research video — tweet 2019233817635221507
ipfs pin add QmXFZFUtGiKDengCGe3PBia63wXT23xCysxy39e6zQZYwX

# VIDEO: UAP physics research video — tweet 2019519753002577921
ipfs pin add QmaD8rZR6vzsB1BQ5kscHuNEHuBgJudjSEjjngwsvQZbqL

# VIDEO: UAP physics research video — tweet 2019671951124623369
ipfs pin add QmcUVAznKnenE2f5DG3kgnixWB9QkW5WTF5EcskMAUi9Mu

# VIDEO: UAP physics research video — tweet 2019671973832585216
ipfs pin add QmanhZhXNsuPmx3DBkwCkNisspD4xa3zscERPf3VoMqp9P

# VIDEO: UAP physics research video — tweet 2019671996133769217
ipfs pin add QmaXsEBhcnwYqFSWFMyUELXJdjMhYCmSifb8fmrWqYF7sH

# VIDEO: UAP physics research video — tweet 2020094356288647169
ipfs pin add QmWonmc3k53DQqNYQHUwN4SgRFUQUj9tYmqfJwZg3hnjwh

# VIDEO: UAP physics research video — tweet 2020784923054112768
ipfs pin add QmQU8R1tQgWTqaRjLVazWg85SnJ8nSGfyHyBNHqcSByMbE

# VIDEO: UAP physics research video — tweet 2021068329654661120
ipfs pin add QmVAD7wfB1u316VMYbWpBQzuYxnZXjYrVz3LHDJTqqQ1H1

# VIDEO: UAP physics research video — tweet 2021436405822652417
ipfs pin add QmR7MrceFrLjn42wiHsWweH9aJAnVehZgTFjvwe5pUjRq7

# VIDEO: UAP physics research video — tweet 2021498583900676097
ipfs pin add QmQUXWpZoGxvz8zX2Wo6dv4P5ehbWEYfLsQervBDwEaaMC

# VIDEO: UAP physics research video — tweet 2021977402373742592
ipfs pin add QmafmfTwNvopZmVcPAxAy3jsvYHnDisfPnXRVvp227doEP

# VIDEO: UAP physics research video — tweet 2021981029536600064
ipfs pin add QmPsabg3chMgfFLdmg8PWs2uRU2yhEC31y43KDRbGZPEvf

# VIDEO: UAP physics research video — tweet 2023166965284847616
ipfs pin add QmaXgMAQ1dfzsKUrQ6Rj6VHVVHBuaBPt5h3sgo514X94z3

# VIDEO: UAP physics research video — tweet 2023855089455435776
ipfs pin add QmbW3vqVvyxhLCPUqSsbtiYq4jMW7bFPbZiexV4rmdWBZi

# VIDEO: UAP physics research video — tweet 2024590881463160834
ipfs pin add QmR96dNNHkk46c7gc36HVJD6UBnYAiwYzVwXrVgzaigP2A

# VIDEO: UAP physics research video — tweet 2024610343155298304
ipfs pin add QmeVnL1sjquHZqgW5MXjeWRYHb5pASPjkssG16sjKZCZMJ

# VIDEO: UAP physics research video — tweet 2025112043427364864
ipfs pin add QmdWey8Q5VYX9ULfp83vSv4n5d8U4qJgXr6HVGV2armAJG

# VIDEO: UAP physics research video — tweet 2025485332884717568
ipfs pin add QmQbpW4TyQx4UpHvoBXth85CCZufwWxgr3n2Z9HUVYzHQM

# VIDEO: UAP physics research video — tweet 2025611185199181824
ipfs pin add QmbzAAJtECPupdazuA7poYR5b74jo7uRyULmeDTgSsEaAu

# VIDEO: UAP physics research video — tweet 2025614982566813696
ipfs pin add QmeygPoURxAiDjohYyK8AhQeyYAjEFDJtHeK5B8M6Uuovo

# VIDEO: UAP physics research video — tweet 2025743058646769664
ipfs pin add QmY3jLhG4CpRLy2TCtg86a8DS5CkkLMn7GkWo4dCeEdLvr

# VIDEO: UAP physics research video — tweet 2025744138713640960
ipfs pin add QmWWeGZcPC44AgUFsWiw8h267eXXvz5RvSnvuDiG6av76v

# VIDEO: UAP physics research video — tweet 2026054442270052352
ipfs pin add QmPDdipYt3efMca3pGofrixLwc7kVkwFgXztM89sVmnqDf

# VIDEO: UAP physics research video — tweet 2026555003578814464
ipfs pin add QmR869YoRhYMhKS2DAXcYfKDP8z54PwzMPipoASG3JfNQP

# VIDEO: UAP physics research video — tweet 2026581391107084288
ipfs pin add QmNUMT8UqfwQWgz37RvKQvgXCtxGkRfQUc2ww24gU86RzV

# VIDEO: UAP physics research video — tweet 2026681250820534276
ipfs pin add Qmf8CjLcPH3N5xKdSwWqbPnM6GYkSZi2UhdeUQD2w6StaU

# VIDEO: UAP physics research video — tweet 2026829773914386434
ipfs pin add QmTPrmbuEPry8gazHZ6Z5BuKQuHPrB8G7D6j1AERvH7G8F

# VIDEO: UAP physics research video — tweet 2026829790314160128
ipfs pin add QmasvFYwFSRPEeT1oUvyKsu1S6DQ2zATVjDuni1MsZ2o7T

# VIDEO: UAP physics research video — tweet 2026878654253510657
ipfs pin add QmckAXmNQZCHjwsMbnE1wg6eoF5nR1qbCFUqsw7q52Prmh

# VIDEO: UAP physics research video — tweet 2027528158095036416
ipfs pin add QmcBGu2CpG3EUUuiVa9dLTLikWaaws74askJUy4JCjLyCm

# VIDEO: UAP physics research video — tweet 2027624017113526272
ipfs pin add QmPTi7kEZDGUjVvUJn4Wyphgqr5LfpYkuvC9DuSsJNcHDS

# VIDEO: UAP physics research video — tweet 2027624299641888768
ipfs pin add QmVgnq5bpUgcF8tsjDjUwsGZHLxeNfVa8CLPbVagzedRhJ

# VIDEO: UAP physics research video — tweet 2027778691519156227
ipfs pin add QmX4nr56BZRJsKGZHVDcKn4ufzvRd7TdpTvfz7Xqj6Lfxz

# VIDEO: UAP physics research video — tweet 2027778733151748096
ipfs pin add QmTLKPRLac1eHi24oYWTR4nDFmKgmpZ3SyWZFYGWbn9CYH

# VIDEO: UAP physics research video — tweet 2027991067006849024
ipfs pin add QmcX47iDsDfz5Dv2TG8FezqkM4gBR6rwoMnSevhj93sREa

# VIDEO: UAP physics research video — tweet 2027991446322814976
ipfs pin add QmPWv2JKJRNMaKyC19RXVnM1RGSRng5FsgvNB9fPmrn9UC

# VIDEO: UAP physics research video — tweet 2027992657595928581
ipfs pin add QmNvRNKmSMh4CosywjaQva9AdYThXJAhJAKmrQVZNyXpsn

# VIDEO: UAP physics research video — tweet 2028248163539378176
ipfs pin add QmSqR3o1YMcYjjzQj6fNADneduQ4CGubQgAxwNWHPiSTNz

# VIDEO: UAP physics research video — tweet 2028379764327956480
ipfs pin add QmVLGRAc3mrUcytBjAwnbzWNwg53ZW9VMubyjnZ8EoFMDV

# VIDEO: UAP physics research video — tweet 2028379834754461696
ipfs pin add QmXcrc6E61eH2QaRfVxmbEfaEQATZDGt87Y3WdL6QsyAJG

# VIDEO: UAP physics research video — tweet 2028588573575069696
ipfs pin add QmXauNfaYJMUaJoj4FmMCHTrqtNwJRf5znQ7MxTngTSTR8

# VIDEO: UAP physics research video — tweet 2028696061452439552
ipfs pin add Qmc2kPAvKtAPMm6q7T7tMzPjUR8nBZUxGSEnwaEJyy8LPt

# VIDEO: UAP physics research video — tweet 2028696138199785472
ipfs pin add QmU4W2W5guEW6A3w13XdZQ29VFd2aiAJbuxtQdQCd9dTL4

# VIDEO: UAP physics research video — tweet 2028704773655207938
ipfs pin add QmTsAj8MVTDRQitxiSsyLu38isTtGi883atZ3rZ19Bw3ke

# VIDEO: UAP physics research video — tweet 2028704801593393152
ipfs pin add Qmdv6uEPtkJagqndLPnTxm8p4yHBCbQb5e2QmvjchEUCgc

# VIDEO: UAP physics research video — tweet 2028704962222628864
ipfs pin add QmXr9kXYaaFteNAi1Xx17F3wNEfxW7YhLcgc1vd2FwQEba

# VIDEO: UAP physics research video — tweet 2028781427270295552
ipfs pin add QmTREEBbgGAmGQeLsV1HtQCvVaRWBe6nz6W3UEzBpfRwv2

# VIDEO: UAP physics research video — tweet 2028781446324973568
ipfs pin add QmPfPn69xSRqpvdyg5vE9v7SSad9hJ4sopA8BEWTfHws1p

# VIDEO: UAP physics research video — tweet 2028781485168455680
ipfs pin add QmbQSz6PgeiqSeUh5E6LjG1UcvHSS77UJjwHTVe2HQiYc2

# VIDEO: UAP physics research video — tweet 2028932949316698112
ipfs pin add QmYzu5grbL5L8Wqvwz9UmqMR8cPgSzNvpg4dg6xrnvdgKF

# VIDEO: UAP physics research video — tweet 2028932973471703040
ipfs pin add QmTtu5Pv2gMqC1FFbCc9D4sH9HgCUUy7Y96wu7o6RemvJr

# VIDEO: UAP physics research video — tweet 2029029446406291461
ipfs pin add QmfMqdnUfdfqN2TwvJ3qHEZL7Cf4ehJVwnWcCvbtbyQvqV

# VIDEO: UAP physics research video — tweet 2029087162831187968
ipfs pin add QmNqiBusM3H4DSToXbUSUE6W2LUNhCdRfCtjPGGJmAuG5C

# VIDEO: UAP physics research video — tweet 2029320640671694850
ipfs pin add QmRFnNohoZmMGKaZV8PCErEDoQDZpQ8rKRo75DTRxiwcMw

# VIDEO: UAP physics research video — tweet 2029437316595630080
ipfs pin add QmZAbCJJrqpCfJCNWsH3gjjvS3dzzguQsEdz2ZiubtDKA7

# VIDEO: UAP physics research video — tweet 2029664361636368384
ipfs pin add QmYWAEdxLNhAtdSvKd6wZ8Df7hJrUasNMsNXwha7yDPzLg

# VIDEO: UAP physics research video — tweet 2029664639320215553
ipfs pin add QmYpra5yGEwMZoApLZo8wMyhbjwGt21iM7q92dKViPbNtz

# VIDEO: UAP physics research video — tweet 2029740807876698113
ipfs pin add QmYEvtNJyTxwXbeHR71doocbx9BfVZTxMeTzkt9JUJoAUk

# VIDEO: UAP physics research video — tweet 2029763068285370368
ipfs pin add QmZuCZkEjqVZWiyfHH2G1iu7L8KGLGZd7B97nn1nNGQSyh

# VIDEO: UAP physics research video — tweet 2029763118684090368
ipfs pin add QmdmLz22bqxDkrPxoxCTxoCbxK7hx4PszAe9KDrnA6UuiS

# VIDEO: UAP physics research video — tweet 2029812572946681856
ipfs pin add QmbSZaBAAx8sMJeSFDcm8wC8S5inxhEznn1Zfi3D49MXKv

# VIDEO: UAP physics research video — tweet 2029821354506403841
ipfs pin add QmQQ6NNVD14xQAA3CFAccRtVjLRTfRZstU847CAVMZbuqE

# VIDEO: UAP physics research video — tweet 2029821524488900610
ipfs pin add QmXsroXghwZxEtzsPRNZyidnH4u6CordQBt1mFTWqbFqDK

# VIDEO: UAP physics research video — tweet 2030107101071298568
ipfs pin add QmUfQPdFrZZUMMaQj66YrC1tpDi84EbbhD1qk7BmPxNbmr

# VIDEO: UAP physics research video — tweet 2030159370751987712
ipfs pin add QmXidvDzeNHHxjjkGtcQoEVm63FQNCd2oAb2sVWSGjgrf7

# VIDEO: UAP physics research video — tweet 2030170972549173252
ipfs pin add QmctgmK3EwwXmTpEyaeS8Xn8a8UdJs9yMGiNsven5ZzXnU

# VIDEO: UAP physics research video — tweet 2030173041544855552
ipfs pin add QmSFVG48BNpPsGiNcXqRkHiJm3zBrEdEBqqh7RQDeBKJDJ

# VIDEO: UAP physics research video — tweet 2030408677577175040
ipfs pin add Qmc8xffUjXy7mftQsStNHv3bfBEiZNqznXw3H4Mqu7aRYM

# VIDEO: UAP physics research video — tweet 2030799429821960193
ipfs pin add QmZmoPnFTM7wFmF11yovLRxXbny1STHjwkeEnDobmGvRH6

# VIDEO: UAP physics research video — tweet 2030865352004136960
ipfs pin add QmXGKgXmT1bCDT4uUytPpT9vLFvK9Kv62XoS8BKur1EZXp

# VIDEO: UAP physics research video — tweet 2030865413119385600
ipfs pin add QmYzVmXWUmAwKh4sJDsjmzcqeNnbZALWtFBk5N4p2QbTQ2

# VIDEO: UAP physics research video — tweet 2030865536792641536
ipfs pin add QmYeTKHvtJn8DbDjr4AgDG8W8hmkTyZsw58Bt7YSBAYbzM

# VIDEO: UAP physics research video — tweet 2030865610184507392
ipfs pin add QmVxTPvHCRhPtFNSo4yAd2JfbnFXvKUuZrtW8kB4av7XWf

# VIDEO: UAP physics research video — tweet 2030898526126006272
ipfs pin add QmfWQbzWKNsAirSL2fFVvKgdf1jtGMyBcFqrvypxFUiKms

# VIDEO: UAP physics research video — tweet 2031136966662889472
ipfs pin add QmRYJUbn2fE2PtwnhsbvEi2PguQKsMmQVP6TWqHMhtb1Hd

# VIDEO: UAP physics research video — tweet 2031137013622255616
ipfs pin add QmTt9y9jEt58GdEE4nrkKfMxzFzeQqZdmuwMDqqSRpxKkW

# VIDEO: UAP physics research video — tweet 2031308121088606208
ipfs pin add Qma3MpXzn3i6cyz6A8wW9o7ndcuGUaA1wQ8rQDCQcZCcxw

# VIDEO: UAP physics research video — tweet 2031312653709361152
ipfs pin add QmQJxdDj3s62nMpeBcSvYswo2ZUv1vk393WFGek6nrXSkG

# VIDEO: UAP physics research video — tweet 2031498634840465408
ipfs pin add QmW6pncBAp9GZKMnakV9gfXFpjA2xVdN8h92eaRFgVjacp

# VIDEO: UAP physics research video — tweet 2032045546916233228
ipfs pin add QmRx6HzsSDFZw8yGhZXH7bQ3hXiJ3PhAovwViyyG5FdKDV

# VIDEO: UAP physics research video — tweet 2032260628157714433
ipfs pin add QmTk3pxSt43tq2cvmNeNwqpE6517Qmy63fSUF9H3q1nAKR

# VIDEO: UAP physics research video — tweet 2032260652430213120
ipfs pin add QmPm2uspH4VQBq5sTeGdzKb4Ph8KdpakLUPtAEXwC87e7h

# VIDEO: UAP physics research video — tweet 2032260671187140608
ipfs pin add QmNUWAvALfWxXxuKewHwPhwhch45Vx579Zx4cpighVWkG6

# VIDEO: UAP physics research video — tweet 2032563634044641280
ipfs pin add Qmb4bK5BC2r4Vk7zUZtP3h4sXEKQGyjqnATheSwsLQcU43

# VIDEO: UAP physics research video — tweet 2032954795250823171
ipfs pin add Qmd5FrLCqCwTF742sHer7JgzTk3jrmw87hLwwCBo2jYJzx

# VIDEO: UAP physics research video — tweet 2032999126695284736
ipfs pin add QmV8ZEBf3daPmvdqQ55SKBvE8wxJV2HwNep5JTsgQzpMya

# VIDEO: UAP physics research video — tweet 2033054723696406528
ipfs pin add Qmd7gY7bcssGGxs8YiXtKCfb9o5tAirES68AAivkBhUENN

# VIDEO: UAP physics research video — tweet 2033117504953036800
ipfs pin add QmczGYuJU6nJJQVZwTHNXWPRAJZbjb3esApCGTPEchz5tJ

# VIDEO: UAP physics research video — tweet 2033117562503086081
ipfs pin add QmPWHnSDNcEnEFHvhNcLTNdMqtsaqVW8NuUAKBrwvqMeuC

# VIDEO: UAP physics research video — tweet 2033809814065975296
ipfs pin add QmQTSG7rMm4o5qfmvumrcciYyyE6tGf6WMtrqeebsFqxvW

# VIDEO: UAP physics research video — tweet 2033809864720584704
ipfs pin add QmefCSJPCF18cGWSBWeaCvs6DLQdpkeTSocg5HjtKqP5dK

# VIDEO: UAP physics research video — tweet 2033959410251485184
ipfs pin add QmcaqXXiQEix8sSXTmgdwSbUzbJMNxs4rbrUDkzX8suWG8

# VIDEO: UAP physics research video — tweet 2034130801634562048
ipfs pin add QmYx7Sq7cY7N1Dgjd2T4GeE8WPsoB3ZvtYsWDJGdi2Dhsj

# VIDEO: UAP physics research video — tweet 2034130843795623937
ipfs pin add QmYoLTDajt2ETEEGNJMvRs6ReJsuYmJHgiGtAQStcuvCtU

# VIDEO: UAP physics research video — tweet 2034130862175084544
ipfs pin add QmfQcsnSDqxcqeiqAEwJqGB3N1QtNCh5x6os17rwXaBX6c

# VIDEO: UAP physics research video — tweet 2034171356779364352
ipfs pin add QmPYjRfU5nsVnBRaF3qZZdBJnDFoKJQf2NyzzcPRjtGH8j

# VIDEO: UAP physics research video — tweet 2034442671448821760
ipfs pin add Qmd6EUGK8MgR8LJxMff2mqFiAYhnsMvxPUNjPTiAxiZVdc

# VIDEO: UAP physics research video — tweet 2034442756681334784
ipfs pin add QmRMgwNtRFq74KoQG21iGhsEAp4ocPSdNKdcPqjtRddW9n

# VIDEO: UAP physics research video — tweet 2034443730158268416
ipfs pin add QmaAuJPtRMU6PDePggvVZcHm9phYbBsPLfVfqaL15raJ8n

# VIDEO: UAP physics research video — tweet 2034443766111911936
ipfs pin add Qme9AFPmCHted76aj4bmk1RHx1f3SfkPACoyEWPerDEZ7e

# VIDEO: UAP physics research video — tweet 2034570014905491456
ipfs pin add QmQBATCtDJz2jLSKdLY7hntJGbKd9op8fakAybH97XoYh9

# VIDEO: UAP physics research video — tweet 2034570113362579456
ipfs pin add QmXamQg16QyUM9ZATEizCyChyofjnZPuH3p5AEy8garVNV

# VIDEO: UAP physics research video — tweet 2034752926321975296
ipfs pin add QmU4R7h8gM3GEPP2uhc2Rftn2RKbtKZgNa2X7q5MVY1dvo

# VIDEO: UAP physics research video — tweet 2034753689555279872
ipfs pin add QmdTNx3XpSFtq4sf4RncSgh5KfgVy1MPwq4bzXKaM2bvEg

# VIDEO: UAP physics research video — tweet 2034801198885416960
ipfs pin add QmYaUqFQR6ZSBYqSemMJNCkJGzr7AYmB6WcZD9D1s4sYUr

# VIDEO: UAP physics research video — tweet 2035249909075771392
ipfs pin add QmWWaE8EMmb4JPLDRt9Szv5JR3BZEBtVdjYpQ3ch6TUgNU

# VIDEO: UAP physics research video — tweet 2035956053960237056
ipfs pin add QmagfX4pGf6EBqaubMSe4PGhPxDQzgGUdwj76ehfavPSme

# VIDEO: UAP physics research video — tweet 2036192068780048384
ipfs pin add QmX8c1QyHFeXuF4M32zZdA8ayabU7kBy5rophbzs4egDH5

# VIDEO: UAP physics research video — tweet 2036192231409983488
ipfs pin add QmekEge8DrobwTxTNC82UjebEFPK6pAXZ2LRJMSpHpSAJH

# VIDEO: UAP physics research video — tweet 2036201790031773696
ipfs pin add Qmdz7eW6Zij37jEvQYkWM9EKZx1aoXf9xnf56mSNvsxSBh

# VIDEO: UAP physics research video — tweet 2036202214574940160
ipfs pin add QmSCrigzGpgn6L8hrJJx8XiPA8HLvJfSSinDLbUeLhvSGS

# VIDEO: UAP physics research video — tweet 2036250409845792773
ipfs pin add QmUZoNZE5ihXnKbBhA5HgNvTwaNL4VZEyX1VMXVoAhunfU

# VIDEO: UAP physics research video — tweet 2036359847227301888
ipfs pin add QmZvJ7fkNmwzLaQnmCvqkW49ujcdBNaBBn4RgvwPsH8fRr

# VIDEO: UAP physics research video — tweet 2036360741004214272
ipfs pin add QmXxsc3HyrPen1egfbaaxHWz6ZpYjREZLKiCeY3XY5NTb5

# VIDEO: UAP physics research video — tweet 2036361123910565888
ipfs pin add QmeFH9PcqeJ2qhL4Rq8FyhktYmu7rV8cPX78VShsccveyu

# VIDEO: UAP physics research video — tweet 2036544485929443328
ipfs pin add QmQioEBWHMWLTkPNfng5pKMuYxVN83R7UdiLxaXzDzvnun

# VIDEO: UAP physics research video — tweet 2036554201824952320
ipfs pin add QmQywr3aYRAdEijHgLauoeGDhayv5aYLQGgyQhPP47Ffkt

# VIDEO: UAP physics research video — tweet 2037284476489969664
ipfs pin add Qmdv1p64r2NCAKG9oYNbXu5Ezd3hRBsghaxXjCCvJQiNCS

# VIDEO: UAP physics research video — tweet 2037339142120673280
ipfs pin add QmefbAyhWRs4Dn6V6hL6rUsoa3npybdzN7hGscHytoGaNn

# VIDEO: UAP physics research video — tweet 2037386232158904320
ipfs pin add QmRxcr5xHoDDHEK2rvsgWr4YZYbXq1P1CQpsHvnm3YwLam

# VIDEO: UAP physics research video — tweet 2038063296780324864
ipfs pin add QmWopriveeXQeTPjBPqFJJp9Hr4kDEj8aHbHcqWhpYTq2R

# VIDEO: UAP physics research video — tweet 2038909613236744192
ipfs pin add QmRGdNoR6E7cbJJUZ12i2ukimzkPQbEatesAVDzJdWJgBX

# VIDEO: UAP physics research video — tweet 2038909635663654913
ipfs pin add Qmd6hc4QrpsiQd5bemd9E6hLwm5AqEaBcMPmi7aRvFvXQ7

# VIDEO: UAP physics research video — tweet 2039098988482420736
ipfs pin add QmSQRmmSsWKwE9ZAtCbJhFx2iW226kPNARsyQCZCvH5Ysz

# VIDEO: UAP physics research video — tweet 2039099804341706752
ipfs pin add QmQuBGfxq6dgrneotAkP6nQzr6tJnDryJW4FFxPMieWUXN

# VIDEO: UAP physics research video — tweet 2039172561586790401
ipfs pin add QmNPsqLRwq2K2pmfyua1uqWznkpUCNiFGPAPazAP2MyaMx

# VIDEO: UAP physics research video — tweet 2039172623821881344
ipfs pin add QmRNTAFXjiEvk1tw3kiVtFdFnT2PLeWjw8LgEJZCUhzvb4

# VIDEO: UAP physics research video — tweet 2039172643157614592
ipfs pin add QmaYxSiMb6FbLQZhbD6w7tjeBjo1KS36SuG7WRtJQTcCb6

# VIDEO: UAP physics research video — tweet 2039489617280507904
ipfs pin add QmajWzbYMs8hGrmYVAzxya9W9CgoTwcJW1HFmDTfcPWUrC

# VIDEO: UAP physics research video — tweet 2039678248859422720
ipfs pin add QmUL45MsZTPeDLZ8peKetfbRTpg8rtzxwfDyUgN6Fsbos5

# VIDEO: UAP physics research video — tweet 2039902664704831488
ipfs pin add QmSzsRZWztEgabgidvvv4Ah3Gu1LQXcQU8Ej1XnwEjFgKg

# VIDEO: UAP physics research video — tweet 2040004027136811010
ipfs pin add QmWZZTBjUfWD3acbh5fxNWHHx3qeL8t93cMUX95zARFxww

# VIDEO: UAP physics research video — tweet 2040366280096821248
ipfs pin add QmQTyCXE5XRFgxVAa52sRtMQLNLC1xHCRV8kmmTf4Z193h

# VIDEO: UAP physics research video — tweet 2040403610497056768
ipfs pin add QmXyuXry1UKm4DjhNDbmZww9ADQm2aULLmnhW4zQHoxee9

# VIDEO: UAP physics research video — tweet 2040686237212921856
ipfs pin add QmfHdoX8B2XrHZZz8N8EFZXjsqpJwWbNZAUtXF6o1LeoM6

# VIDEO: UAP physics research video — tweet 2040686290426109952
ipfs pin add QmeTg34HUC7XYDauQsbgsGD9NNNTtZ55xGzymzo18qGnu6

# VIDEO: UAP physics research video — tweet 2040923689236287488
ipfs pin add Qmdwe7NG2Kb3T4tQ3auwX9JjxMr3kGGL8tzMQm6KX8P6rb

# VIDEO: UAP physics research video — tweet 2040923897072324608
ipfs pin add QmQqpmSHBqb4GtDsiAabwvJ5AC94haHx8QWLx52SptDxvu

# VIDEO: UAP physics research video — tweet 2040923946653192192
ipfs pin add QmXopep2mMMez6UbJBeyychksb7znYdutTWHLkZw3VvrUE

# VIDEO: UAP physics research video — tweet 2041367728767041536
ipfs pin add QmYaTYoPgVHrnc1MvCMCzYFWhGwNKtLLzwi2iKcu71EGx4

# VIDEO: UAP physics research video — tweet 2041368193776889856
ipfs pin add Qmd3THsEQiqiVLLB3ftPqMcM7SzvU47ktRi7QSKz5cSCvi

# VIDEO: UAP physics research video — tweet 2041368219865473024
ipfs pin add QmQcfEbrqh5NywFjWnzqRy8MFTDo6esSiVJFgFWg84P1WJ

# VIDEO: UAP physics research video — tweet 2041414520774836224
ipfs pin add QmU5LrtTQDHhvRNqGVu1Vdhf37BT5EJP5yYuiGyJDn4sPP

# VIDEO: UAP physics research video — tweet 2041458850507939840
ipfs pin add QmUVLyYBgHqqbskQiJAE3RDYor5JP8xjyEayTJuygetoSV

# VIDEO: UAP physics research video — tweet 2041458881797472256
ipfs pin add QmPr4A9HmaB91t2QBMJAikYQBLF2mzoMsgK4Uv3WX6uWEK

# VIDEO: UAP physics research video — tweet 2041458910029357057
ipfs pin add QmWScAjCJNZcm23XArwsGLMT1uDsDky4axXjre72sWcqkY

# VIDEO: UAP physics research video — tweet 2041674585805090817
ipfs pin add QmPRsKrqqfs32Ww9tDSM4SVXZ7S8AkfYGk1aLCZVR5yDHu

# VIDEO: UAP physics research video — tweet 2041674654021251073
ipfs pin add QmXS43dLTRe6dQg9SNvCbAyHFdmXbP2zvYnvz73Q7nvCFh

# VIDEO: UAP physics research video — tweet 2041683537192218625
ipfs pin add QmejWGY8KkHHvHkhYKegPvrhhFgPU3YivmP65vyRprCwZd

# VIDEO: UAP physics research video — tweet 2041683563737968641
ipfs pin add QmRNBKiCj1C4huuTZm9GyyyknZ7nbDGsqfjvueKdAKB3AL

# VIDEO: UAP physics research video — tweet 2041683584633991170
ipfs pin add QmUT4Cznn8DpH6UVQLiGr9MqKYXiQXP9bjdTtBx5CiaSvv

# VIDEO: UAP physics research video — tweet 2041683608465977344
ipfs pin add QmdQi4pEZX7Jp4T1zxbSKxkYSpH7LB1CDK4UxkuGu5XGZk

# VIDEO: UAP physics research video — tweet 2042222844860669952
ipfs pin add QmbfnZ8QCsbhxVDn42Lhcx9i9oiZDPbcC5zyoQnryM24yV

# VIDEO: UAP physics research video — tweet 2042223819025420288
ipfs pin add QmPRFu2TF85xVZtpytF4MRkWCXx68Ch1JZVnueF3Es1s6n

# VIDEO: UAP physics research video — tweet 2042517002548580352
ipfs pin add QmPCGVtqNGuTPyaWHA4zyshrM57bbhkAqy6L2GCQ8kuUyd

# VIDEO: UAP physics research video — tweet 2042731830890426368
ipfs pin add QmYRRJDWrWjADo4sdHbRYcX3cqiWJmGFgGWKobscBLCP2b

# VIDEO: UAP physics research video — tweet 2042960649857437697
ipfs pin add QmYdsjXG35F3rq3Y8vpMYs7WJ3iscLxmG99hh37vUsAyKe

# VIDEO: UAP physics research video — tweet 2043282126775422976
ipfs pin add QmWRzd66BrFaKaS3oofTA9EpQd9jfDgtx6LNaekgaKAzXx

# VIDEO: UAP physics research video — tweet 2043457882012917760
ipfs pin add QmRjoPybT3y9eP6txcoApGNKrykGKarZVGCxcxrGrx5gjR

# VIDEO: UAP physics research video — tweet 2043502342260346880
ipfs pin add QmRMbM7j9vSotR8EmixDD4rzLUgjexNTiqzBp5AVYbJ4MR

# VIDEO: UAP physics research video — tweet 2043508669527334912
ipfs pin add QmeprsxqG4W4YexuHFHMwLcLEMgafNGzGvWueNZJxAskj7

# VIDEO: UAP physics research video — tweet 2043606527630786560
ipfs pin add QmdcJ7qZT6LUHkS2tGMoMPkTCJoVtHq9jt1ZehhjxXDweX

# VIDEO: UAP physics research video — tweet 2043715767997452288
ipfs pin add QmeRfhakML6iwZQE2EMqctNztSMrMEJGDnrHBJMkctHuev

# VIDEO: UAP physics research video — tweet 2043978897302401026
ipfs pin add QmTKV6BTy2Sa6WsrJmfykvERmvUnTZmAnXJapCW8LXouj9

# VIDEO: UAP physics research video — tweet 2044022002504347655
ipfs pin add QmRVeTUycBbydDEqvRkRBEtiVygAgETf73GNpz3cHwUKX7

# VIDEO: UAP physics research video — tweet 2044024931256852480
ipfs pin add QmPDmBUdDfq1FfZx1qfDkmeSbLGpKjdV5bEBwfyseEV538

# VIDEO: UAP physics research video — tweet 2044596310473580544
ipfs pin add Qmdct3rKYbgvwC8sTzcoLmgJEqzq3ByjDE3ZA3cBJRv9SH

# VIDEO: UAP physics research video — tweet 2044924356170854400
ipfs pin add QmbiX1gg66z4Z2Fw7neHaxqujVbVHMFmEoQzVjH5NmD8cz

# VIDEO: UAP physics research video — tweet 2044927638201110528
ipfs pin add QmXznvm5sekYHrZy1Be3UDuuERW96dDJnakrdbWKx94ZYF

# VIDEO: UAP physics research video — tweet 2044942800614268928
ipfs pin add QmVva9nk6YxGhChS6M7Ndjr5mRNU92i5rxchKFRWkZQkR5

# VIDEO: UAP physics research video — tweet 2045282624676282368
ipfs pin add QmNuNdrLBqLX1YM7a64M1Ej8goJqHe7JrCFAFk4a5VADU1

# VIDEO: UAP physics research video — tweet 2045371465424568321
ipfs pin add QmRgvdh7A3dxkRREhXsm65AkGpeZiyE9YruSe2Y5BSM2eQ

# VIDEO: UAP physics research video — tweet 2045637997270593538
ipfs pin add QmQwhBDmuuTjzwwXD3H4nzawpN6E4SGs9V8N8YGXSmZX8a

# VIDEO: UAP physics research video — tweet 2045694404695031808
ipfs pin add QmdzB6wdY9bVvJx2kEeuovKHD5C34C9XHk7XuJjGsuj68B

# VIDEO: UAP physics research video — tweet 2045805270564212736
ipfs pin add QmR1CSWjrUbAka9LfbMXejjRtjGW2M7ENYpd25FRFmwWnS

# VIDEO: UAP physics research video — tweet 2046406373307822080
ipfs pin add QmTcMVLuj8dg1Ue6w27MXRLxz1LJQzB2f1DLjJPM8pZ7ui

# VIDEO: UAP physics research video — tweet 2046406394623168512
ipfs pin add QmUPhzbLcvz95HvdNFjnxX1dpe8vPETLwM9nQeaEKnNWqz

# VIDEO: UAP physics research video — tweet 2046726719734939648
ipfs pin add QmbxhTWnLuuaFR5VyCwpQv6NGm6Qh8U3FkrZwqB6tgYbk4

# VIDEO: UAP physics research video — tweet 2046726749254516737
ipfs pin add QmUN3SeTgp6tvPfRifgiCL7v1wCaXTtwANJzMdVrC1XmCU

# VIDEO: UAP physics research video — tweet 1913350813298352128
ipfs pin add QmVJeH5uqrAUYg5nNZzcdpMtU4VCJbcXho6zS2usutKtYo

# VIDEO: UAP physics research video — tweet 1919642447384346625
ipfs pin add Qmbf5xD9QqVYXrt7ASLtgFRwHV8naHDnVfQQHEykaLcMMM

# VIDEO: UAP physics research video — tweet 1920981390658560000
ipfs pin add QmYpDyDY5jEFhLoqxeSbtbtJjtWheET5rbXabBYtEhB1zv

# VIDEO: UAP physics research video — tweet 1923902243083812864
ipfs pin add QmcArEg3BTsfPqMLz9QF4RFgEfi3axRt78JZyhePNPRKQb

# VIDEO: UAP physics research video — tweet 1924618048121798661
ipfs pin add Qmd235NRPxuN2LHjcmxRhT45uzKonZTvznbGg8gsqYKtWH

# VIDEO: UAP physics research video — tweet 1925884998290157568
ipfs pin add QmZQL11XiZ5hZsYP7GQQccJgdq29JoSEhbK8ERaPfus7wi

# VIDEO: UAP physics research video — tweet 1925885025691516928
ipfs pin add QmPr8tpVL5DhNqzXi3aXDCj6vThd4HoK9eSTSfdxg9gAB9

# VIDEO: UAP physics research video — tweet 1927152613461573632
ipfs pin add QmVJeH5uqrAUYg5nNZzcdpMtU4VCJbcXho6zS2usutKtYo

# VIDEO: UAP physics research video — tweet 1935493804909355008
ipfs pin add QmULDubTo3kdDRtPSyVLsgu8aLTpvB6Jro2aTUDYNC9QKV

# VIDEO: UAP physics research video — tweet 1935609768959512576
ipfs pin add QmVJeH5uqrAUYg5nNZzcdpMtU4VCJbcXho6zS2usutKtYo

# VIDEO: UAP physics research video — tweet 1935688539930288129
ipfs pin add QmVqFLVafnZ5fCYVFfy1gSRSfMvyEz6jCd4HRW4bqVwe22

# VIDEO: UAP physics research video — tweet 1937073483705417728
ipfs pin add QmR7rDZTQKSARsAB2s3yDJn6DUCjAyJWWHZPH1kssDWYDV

# VIDEO: UAP physics research video — tweet 1937428694521511936
ipfs pin add QmTzHQoGSiSpETmVXn2xu1DyHzJabm8CJqP2CvvkY93auZ

# VIDEO: UAP physics research video — tweet 1937646623049535488
ipfs pin add QmRHyP9MGZPUrDw1gBbrjfBY73vooza44vz4Waq9TidRHA

# VIDEO: UAP physics research video — tweet 1937813747239919616
ipfs pin add QmRHyP9MGZPUrDw1gBbrjfBY73vooza44vz4Waq9TidRHA

# VIDEO: UAP physics research video — tweet 1938372741918572544
ipfs pin add QmRHyP9MGZPUrDw1gBbrjfBY73vooza44vz4Waq9TidRHA

# VIDEO: UAP physics research video — tweet 1938728069528961024
ipfs pin add QmRHyP9MGZPUrDw1gBbrjfBY73vooza44vz4Waq9TidRHA

# VIDEO: UAP physics research video — tweet 1939293159223144448
ipfs pin add QmWnvTscXSazNtFHxbgP7iezSGr6aPkLjtMseamCXXfpac

# VIDEO: UAP physics research video — tweet 1939293224616783873
ipfs pin add QmXSWxQLyHbS9QmXXaTGAT8payUS3GdvFagjJDujSpZSmZ

# VIDEO: UAP physics research video — tweet 1939482237382082560
ipfs pin add QmUoGbu2dqY6gHdTMSPTYesys89CK8nPkQiGn8gMn9ndE1

# VIDEO: UAP physics research video — tweet 1940527362254188544
ipfs pin add QmaTzJxujDtDfo2DK4auEmCNgEdQq8kU2wvJEWyh4Cs18P

# VIDEO: UAP physics research video — tweet 1941310612078014464
ipfs pin add Qme7NtjvqMWW4WsumpEKSdeZGjvBxdpijttKu4JTfXz5TC

# VIDEO: UAP physics research video — tweet 1942000022284865537
ipfs pin add QmSzRfniuwkg4dugNNPh6T3aD7VzWAS3uijP9HioqWgD18

# VIDEO: UAP physics research video — tweet 1942000040337350656
ipfs pin add QmaTzJxujDtDfo2DK4auEmCNgEdQq8kU2wvJEWyh4Cs18P

# VIDEO: UAP physics research video — tweet 1942865021027139584
ipfs pin add QmaVUczam6Er6LAwSbmAULKYtb7dBFxacecMhJSMMyRHPM

# VIDEO: UAP physics research video — tweet 1947657622414331904
ipfs pin add QmXSWxQLyHbS9QmXXaTGAT8payUS3GdvFagjJDujSpZSmZ

# VIDEO: UAP physics research video — tweet 1950320545847001088
ipfs pin add QmeCjja1HTHnWkEcF5Mcci3jPnT8tGgLLHJwKwn5DdAvuD

# VIDEO: UAP physics research video — tweet 1952499963872874496
ipfs pin add QmVJeH5uqrAUYg5nNZzcdpMtU4VCJbcXho6zS2usutKtYo

# VIDEO: UAP physics research video — tweet 1953571746541686784
ipfs pin add QmXoWM3n4woU1KpTEByHRXuJANZYqBwbLLBrkjw3vEF4W8

# VIDEO: UAP physics research video — tweet 1953578965656113152
ipfs pin add QmXSWxQLyHbS9QmXXaTGAT8payUS3GdvFagjJDujSpZSmZ

# VIDEO: UAP physics research video — tweet 1958469374895165440
ipfs pin add QmejSqLQX2fVTJj1YpcXr1HEd9mEgwkqBgeeDoZtcgXcWk

# VIDEO: UAP physics research video — tweet 1958469412534763520
ipfs pin add QmTfU3Wmmcw2bTmBThPwHajsewMyaTJk5PmMpDvhkNxsU3

# VIDEO: UAP physics research video — tweet 1971332286403706882
ipfs pin add QmRaP5tpmVpU7SntqVekEG937ybCK2hV6GCiTuNt9Ud9uz

# VIDEO: UAP physics research video — tweet 1972053713864028160
ipfs pin add QmVJeH5uqrAUYg5nNZzcdpMtU4VCJbcXho6zS2usutKtYo

# VIDEO: UAP physics research video — tweet 1974237247705923584
ipfs pin add QmWpMWE8DLkEjiaDR1PyaxLe7oPBeoipTZodCa1zQWac1T

# VIDEO: UAP physics research video — tweet 1978288724460113920
ipfs pin add QmYpDyDY5jEFhLoqxeSbtbtJjtWheET5rbXabBYtEhB1zv

# VIDEO: UAP physics research video — tweet 1978442758991081472
ipfs pin add QmXSWxQLyHbS9QmXXaTGAT8payUS3GdvFagjJDujSpZSmZ

# VIDEO: UAP physics research video — tweet 1980913785419296768
ipfs pin add QmXpdni8xbcCLhYJ3pB1qi34dTzeWBwoXTPyJ188j2p18u

# VIDEO: UAP physics research video — tweet 1988339700588048386
ipfs pin add QmQ6qsHyVjwRARBLNCYe4xWyb9arMtg5uxne6caryU4vmZ

# VIDEO: UAP physics research video — tweet 1989891329967722496
ipfs pin add QmTKw6anrSM1Fe1zbKwCpEuBAsJnU7swhM5Q82WTakovcW

# VIDEO: UAP physics research video — tweet 1990161909908418560
ipfs pin add QmVJeH5uqrAUYg5nNZzcdpMtU4VCJbcXho6zS2usutKtYo

# VIDEO: UAP physics research video — tweet 1990166786147520512
ipfs pin add QmXSWxQLyHbS9QmXXaTGAT8payUS3GdvFagjJDujSpZSmZ

# VIDEO: UAP physics research video — tweet 1991687778166534149
ipfs pin add Qmcnc3mE23z9QunQ3W9oYf8mtAkStuAUTAK7tkE4MAcaSP

# VIDEO: UAP physics research video — tweet 1993429067937562624
ipfs pin add QmTzPQjshrrDCX7NdT7dvYhDqyPtFLggfBp7EK55qFFkrj

# VIDEO: UAP physics research video — tweet 1997767431184695296
ipfs pin add QmQw1VA6sqaz75YVixb11c9bAHCJEch2UXG6f4v8Yzs3jZ

# VIDEO: UAP physics research video — tweet 1998210955034161152
ipfs pin add QmVJeH5uqrAUYg5nNZzcdpMtU4VCJbcXho6zS2usutKtYo

# VIDEO: UAP physics research video — tweet 2010494281300221952
ipfs pin add QmWnvTscXSazNtFHxbgP7iezSGr6aPkLjtMseamCXXfpac

# VIDEO: UAP physics research video — tweet 2015730486145073153
ipfs pin add QmWnvTscXSazNtFHxbgP7iezSGr6aPkLjtMseamCXXfpac

# VIDEO: UAP physics research video — tweet 2015744585495142400
ipfs pin add QmWX3HrqiL77mm38SfyDd7eodCpKXv3z5yvT8gR9SiEDYF

# VIDEO: UAP physics research video — tweet 2015995613650014208
ipfs pin add QmSFUDKB4fWQ1HucWKUzCuzCoTckGEAyPYov1umM6LSKZ5

# VIDEO: UAP physics research video — tweet 2017215277357035521
ipfs pin add QmVJeH5uqrAUYg5nNZzcdpMtU4VCJbcXho6zS2usutKtYo

# VIDEO: UAP physics research video — tweet 2017532741684985856
ipfs pin add Qmf1PkgbhDKtUrhkhQ2iPFq8AaVUaLxeBwczM1xphz7daA

# VIDEO: UAP physics research video — tweet 2024993521615421440
ipfs pin add QmVJeH5uqrAUYg5nNZzcdpMtU4VCJbcXho6zS2usutKtYo

# VIDEO: UAP physics research video — tweet 2025747259263238144
ipfs pin add QmYNUUpNRjL8GRvcCXF5aiJ1p6Uquug4H8R5jkUpp6wgF5

# VIDEO: UAP physics research video — tweet 2026056346026868736
ipfs pin add QmTzPQjshrrDCX7NdT7dvYhDqyPtFLggfBp7EK55qFFkrj

# VIDEO: UAP physics research video — tweet 2037283587087904768
ipfs pin add QmVkKR77VEhPCzUjsitRyDJkJh2Erw6yghqTwuk6KffrRq

# VIDEO: UAP physics research video — tweet 2041570679372574723
ipfs pin add QmUu9Qnrw4QDRwDiRRz39xcUf9BWqkxhfNJaVLVAc8iqc6

# VIDEO: UAP physics research video — tweet 1946536045157208064
ipfs pin add QmQyR2e3emVAY3hvucpbgY9udHJtevKjVnyxz87E9W3dsH

echo "========================================"
echo "  Done. All Physics_Math videos pinned."
echo "========================================"
