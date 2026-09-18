#!/bin/bash

URL='https://administracionelectronica.navarra.es/EmpleoIntermediacion/listadodeofertas'
HTML_TMP_NAME="html-tmp$(date +%d%m_%H%M)"
JOBFILE="new-jobs.txt"

curl --url $URL \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: es;q=0.9' \
  -H 'Cache-Control: max-age=0' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -b $'GUEST_LANGUAGE_ID=es_ES; _pk_id.10.c717=b8bb84483c840624.1786716536.1.1786717465.1786716536.; _pk_ref.102.c717=%5B%22%22%2C%22%22%2C1787501914%2C%22https%3A%2F%2Fwww.navarra.es%2F%22%5D; _pk_ses.102.c717=*; GN=\u0021kGlhaMQkibcbuyC/wIdmhVq2x64iuxEW6H+HiN1is9qnzvGpV6hHErYHVlU1AzWtKlAgUmlxabx111Y=; __AntiXsrfToken=433a0f611cce4191a8f9c2bd58bf9e17; _pk_id.102.c717=5de8d7ffdf6663fc.1786609089.18.1787505221.1787501914.' \
  -H 'Origin: https://administracionelectronica.navarra.es' \
  -H 'Referer: https://administracionelectronica.navarra.es/EmpleoIntermediacion/listadodeofertas' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Sec-GPC: 1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36' \
  -H 'sec-ch-ua: "Not=A?Brand";v="99", "Brave";v="151", "Chromium";v="151"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  --data-raw '__EVENTTARGET=ctl00%24MainContent%24cbPamplona4&__EVENTARGUMENT=&__LASTFOCUS=&__VIEWSTATE=sTlNiSB5u2ouOhnKG72DgwEzDPV91lHfnyLPgHJChLwa2E2Ol4QazsBnoYB%2Bsyq6LL37rB0SwExQ5kwav3Do9X4gYiRuc0sdZ3eV8QDeX%2B5pV6VTePz08uqvhVAlRXVq1YqFTXYwSOVC4TBTvRTaAOxPjcwbIXdm%2B2oJ0OKQnH95cx%2FQsJkvaYXW%2BdO1sA9m3GTO7EAgBFM4juDwQV%2BJNt7wTh9CmJ%2FKOoVmDuV5A9D7h6sCrx4ZFdTJo1V%2Boa9iP4F%2F%2BG0d4fYWsG1hP4ICaA4G8CgV4EGL5o6VKFaEJWX10Esg9BHmHJLcEWvSTThy8NgMdQkbibSdXn85EYF4CYSQgaqo7GMZtttz3Oo7kqMJ2K56al1QrqifDUR%2BhTJabAZbv4PEmWhERgFghjN2aTkTPMAp0eec1Wdlx2EzgPdCDKnpoeUrQoSkBG3aKtP4KR7kz%2BTssdQ4I8jQMIyh9Zu9Em63KC2zmvUZT7mi8RIfzo%2B9EWqOF0e8kWJCXFz%2BmxCKD5%2FnRqbE7FQh84OVq%2FMtTtvMEFdPm6pP5cgFhFsPxieAx9X7160yvS8nJbr4OLZLr0cw30tylrD3W3vd1CXJZ2djWQCoANDq%2FGkiv2bi%2FsLQVWLfLBo8K21cw755tj9nFpCBEM3Ep0BvLb8giaZyCLwbqM1bJfxVap4uGYBTQ6RkC2DYPvRJkyMZwHs3%2FwHOyEz1wDOTQNFZa1NLlwJTi5K%2FPbXc8jerKxSsJ0HyNoZTf4c60fwbvOosVjCvUKVHBxirF26xNzAWZHGFTvl9LcgYlJCmpJY3vZ31LwNKhGwomsynfTOj2l0ZdB9%2ByIHR8w9ojS0hATlyy24ooPjAS6VK1d9h24n9F0hIFOsMn%2Btwf29vx2F7ka%2BgF9Va2zdiUtB1mxYUXEcLXR8gEMp1NeQ120Zryfzoqd9KYeOQnYVG%2B4YDSn83M%2FpUPTiPV%2B3H48zu0g2Nnq5jarDh7i7oC9hCJt2mywlxKiQllge6KjaeT0GEy5Yi1jvUlkE9UuVdw5NmEdVm3%2B%2F0McCTFt9O8v2UgdvE3QI9l1PHb3foq1lJkTcZ9dgU%2FfqGW6btmfYTn58hofxMSiBgVRmZMu%2BoJRVsW1BQjCtg0WUy%2BfuL90HPRe7WFdEE%2Fanym6F28v97NaHcY9nOc5wXbbe%2FJcj2N5kukhPRfXcxOBAT6ph2fFlsY%2F%2B57lG95XA0zC4a%2BXRKTHzxvQq2%2B3HqcP6lvepBCszFYsRq%2BZWQAB4IpoCVTDwdAS0UvfDnlA8xH4CCsmyIrgJSOrwS%2BWICLcdt6LaC7Ey6KDWsYeV8PEb8CAGTus41QUh8cYyzhXh80dDfRCsyBPHqWDQIRshlOdHi46FugP4ho5FSVNueXB7hIiKSuUofrq2MuswUadXTvth7skiXu%2F31WCQLZ15VmlEtRoQjbp6LxZ7hguTsm8m0z2p1SJdJtupMxFXp3mu9KHFRYKxCi918xKBmWwItyF1YIRdpYwPkbx1DqfGu3SspKjK%2BnbvuBAHZcKM8j6PWWnZN6tKfv1c8YcOEGfHDd46%2FFghUexHRYc27ZTkRuLJOKDeUfcYTdii05Ak%2FH5WzgIU9ut0z3fXb1axRm63E8iBYHj9zxgvHD2VX7hOkXz845Be%2FlI4hl3QIHRAL18B04aAtmhm33ABFwcovMEdd5r%2Bal5NmrcP0pDYP6Vz4UbtEULMmkVlA43cB3%2Bnh7LgZ16KORBzRiuraTeI7lL7Sk3RY8albW1NNwRB9TtWcVuDbxjQJig4gG0%2BBE7QMVGtTXdB%2FPkSkIsDGWwdmshfgb4XNEK3ukWYESyoG%2BCToOEXi3OKzn2YskFAUL9e%2BygkyRaBKt0EsqRDcBPnJ75n35y29i35Lhte8ifc10qeXfTv0BlA64jpmPSccnHX0ghuua%2BxvhkE8MwWcIT%2FScb5mnOi2k6cTCMFz8pSs%2FSMMR1onRfvtkbQ71DJpGqmrRn3kLVh%2F%2F9Wj1XQhUnUc7HJoo9vj76b7lvILVGycdyES%2Bq90%2BAaTEVy%2B9%2BGhsS42CUihScOCRdUNeZzpuyXxeP28itK4yV7XdpgBPN0aMSi%2FWxiEvfabZfyuNA9%2FP%2Fpq6xIwO4ilbFbqOHz3hnYDpTeTJWeP9ohS2KGX6xL89IHjLMiY9Nzpmjh7Yv6E0AGCfBhGX7lOa0t2%2FFa36Fg0LzLFdR40V8fEpz3I6Cr40QmXR%2BpMqiRD8kPqulCi9c5iwswH0D2uMVdlfQBFoHcKY1z9ofuLnfcLq2kA1OBSinPJRWYz5V2PQiC9WxrCMEE0suKX5DggxMBFNvtIo0SALl4nQowPCOp6rjmX1EFsUDRXToUKD9OeEUFCJmvm8wNU8WBTbQlrFovV6wgT%2FZwNf3PxJQSrqTEwFmG4pprYHY5xEnQsCtgzIVb%2FFytUvZi9VN3FAMsEMXMeyXqh0d6hVeM9xKxKxfAHMQ7N0PmCYCxoeUGN3OnZlfilVEMlhRD6fO%2BRv76ECddAOq8HabagZ%2BrOGzzW8rrDfr50gOVYt5BhiDcNm0ntAbUWp%2BkfXYrXZsjcbc3bYcLS5LSlehvxDosmGEISPBb0oMn5qtSb7gB0CHMcrI55I3O4vqee5nGkM4NhWjo0CR2iN2tqVUViEwFP%2FbmhWJ6iQjKmV%2BGvZAgEOOslGN3GPdlXiufOoW9Il1CeZU09xCd%2FJRi9f6bliKbOywRoOVxTyRnEujj3XNnPzOFfnWpQDYuxUQvWprePyRslkuhcf%2BkMfYBv%2BmbgrU5DhGuQa0fgyEawzFXRd7dDHj5IseNsk1Gwz7AdCuP%2BMZnpf%2FAcuGTDcYIXGK2PgihaU%2FPIGFxRXEocsUQlR1Qt1zwpIl5m0ID9sltOn%2FLMXzPI8UrgI9qlKaWT5%2Bzu9Sf6im2uTj5Ym%2BCHEF4NBRh06vnPab8CtzsVL5ILxRFyCJyjm14B7XTZ6d2nl4Ocqn%2FpwsTGGXpEOGrR3HCoowWYKxvrVJAQPPioI444gogfGe%2FYWqFcq9wqjFBekWUGXUf5N%2FEKnIMVJLo57wCdYI%2BhZmyMkoCoIWno7sZybxiUmZCOfliT3qbJRArso82JtYGrvxmaxvzlNHNGgDRtTcfaajluJq2pPkRVcl51ngVDor4GnsG2U3iiWuCCBHEa11Vbg%2BbH3P0wn6FfAdiUc%2FfU%2FolA9g%2BHT3NKGYlziDKzL2XA2KSAYTqOJ2FCVawzHQ70V9kURO6YBwWpN%2Brinfb8NhDmLhM7kmuSAMH4arSuDv9PEGjNQuCW3287fQyjWtCL6p7nOOH2ZLsDnmGFB139ZtEERgl9mxp4i63UVt%2BnhXR%2FMX5ts3IIfkYCjA5W1fnDo36LqjJaUatJE6bjN1iI00xqYfCQcyANHW89QxLUz9Eg%2F3lDE%2FcPJf%2FmhPyyxvTDuC78qvozUNnTyGZvTqBpMj5amTfSbJCII4koxjyIKlHxdBqR2P5rmtKvamfDd3mC2q3Zlzg4vXyPYy7ofGANSODG%2F7Lmx8HZUtds467YPaccSvP6rOb23IxO2kBGX3IGIhhNMzN3s1DEpzUDhHpNMw2zwjp2zfNmtAv%2FDfosArGP6BWtm5v4YTbRtSM6l04Siwi%2BRu%2FhSaJomXbu5H7FiTLK8GExZyXARDi09fOIFyVnQuuEdBmDs1U%2F16o2337iHQTTt27SSlvkZlOOLZK5vJxo8cD5gZZnuZIagHtes%2FS8EknZ75NC9o%2BtcodJo%2BsR63F%2FvjKRLeBtYPGYthVXalvuIN7MsqGrpVzHQI%2BL%2F%2Be08J%2FP5FTYkCD1nTsMKl1iVhgFKvs2LsAkZsEFTWK4tE6%2B4DOEdjnF0HsppwrkCVbtLYHTOLC7JAYc5WYCohFeWa4RVkhSk9W%2F4esjpjuFkF1p%2BQ0OVxUqE5Lch20c9FAqGzGHbw5VxPa2cwHdK8JQsDBnaNUh6vQ9rgCRcQcNSxIC38zqYuj%2Fho2caoNQaAKez0%2BmCAh5ifj3jYApHikvginY7Tee39BrXIO6%2Byq7VWTsRuTcJaBkepOoKdvtCZhoCW0fVeOilxGKVMnjyqyx4AJDwNeXy39D8O9pLkuTYWolzHuCoNFt9VpvwDUo9JDbL%2FVNyfDZBagSXlta4E%2F7gHqrspySPFj%2B7vX2mKqHBFDcWRIctOwW51P%2FgHafeEnrnhxypwF3lMN1PMPMzP2bfN70xV3PeSFRWtzr8MnvBT2qBz3p5GVsVFMIX7ZhEwUvcQhypfF1q4FbjRPrJ4%2BIuFKrO4BnQj8W3xxJcmorFAl20m%2FjEtAn32wigTBgSAFgD5M26bD9LGsZHbHFcTPm3tIeVQkYf8k0SDhG7Xrkl2c1FacFs8x%2Bd2DtPHmMEiDaWLV77oD8MyMtpP0eE82edqTmL7%2BDK%2BcydcpvhMHuM3F0sSdD07gQ%2FaGI0wxt254p6XJ2Bu36YPf%2FteBkOqw4QnYPQfn09Tif08xGhcaUyfKiByF%2BmaeXcjd0%2BYtzs9pacCmiyRtvHh5h2jwaWi9VE0h89UICZ2OXVJbmkYUxAtQVEvpmd2041S42dFve7ON%2FP%2BjnZrmigblDeYYUjRylqsCkUkb07SIjPlw%2F2719icKCzQRTjQS%2Bt0wcfzSvgo9p%2BckIKT4s%2BYtsSjYsCC9x9Z4pRj8VxVWtn2lyQlgT3TXgZkjqH%2FknEgJVMucioB3DNfk8KFkAIplMWtXAKZc8L4ma7DApJ7BhRE8GoGgysjEs6c3YrEp3RAUNPh5joSdYXV3BlRxETGlbf7j3hxqf&__VIEWSTATEGENERATOR=E16FC84E&__EVENTVALIDATION=v3RAkADCh5hsZNT49io8dCkbBOJd0qDx%2Fl2JdFDZP1amFLt6lf3sVj6S6PAL52Ym7Ma1RLIVqfbWIC5oXpK%2FApdPal2tOW0W%2FDrnv7UNydUPNDAgAdN0ReZSxqg8k3QsNsXVcATnA3TcY8B1AM2C2GsCU4Y3Red9XYygG5Kix4pZZ7psp39muBRNFNwTCZKkz2oLbAWC51W0HlhreFrS1NUfYtM1IAGrdc7%2BugLFiTg%2FurxFVqbCPmHzM8JePxtqYTtztLWpnQUHFBBKWdHLKOiSL1pozaFVUw%2F1ZaV7fKRdKNhxj%2FAm4%2B1m%2BnUsDJWxeR%2Bbfmfpt95rwP6VADfA7aJEEImZju%2FdkjkVYMohGH%2FuOo4vCQpPcLq8zgMf8sK4xpWEkpsVJkGTsqcJf1pi199z4IYcAqVye6%2FAAPZRKCN43j4ayv%2BuYwh7g4H0MadEyi35WZqIfkt8CVsXb28wXoKbkBcQSGrw0nzO%2F9YmFGkrL7UkDG2QWWpJ47NUxwpE1uJPNBo73L7f0EE6zfoZEDjIjcNmefmJ%2BFfVFy6OBbolZ7z%2B8G%2FhR0BT2L%2FpR0nrlbhMzdIK8wYXHHpiuzSme81b%2BiA5fz77edbO%2B6vNROXkRaPuGbOx3eilWdzXMOzZQZYQsB1%2BRO%2B9%2B326NHxmekEcS0xaCts%2FPEQWuiFKFU%2BeBN%2BaGVTqQ9C%2Bp8gegxwLmlObkezJFBPje%2FseEDsAM7HEbxQec%2BptRq84m1leuEzmluq7s0R3aBpVIB7nXVD8VnVpw71QwzG%2FHaBJIXzSUm6vLSV7wDkpjatV5sAO5PAMzVWsCz%2B9HefE4uR%2FTs%2FidZRMVSQ1EE87NhkjmJKkZ7ljfU13DLI11IPnMorBH5GGQFlPg8cHP%2FMoShocvo1GlMgDZB%2FgBmzRpJd1dyHiG3AHdfWlXvVDDZUQnEEbNpsbCzJDTb%2BCzQZqerhqDXGg59ur0z3oONh65n0gyKdtkzjshBc%3D&ctl00%24MainContent%24TextoBusquedaL=&ctl00%24MainContent%24cbPamplona4=on&ctl00%24MainContent%24verbien=reciente' > "$HTML_TMP_NAME"

pup '.miniresumen2:first-of-type .clearfix span text{}' < "$HTML_TMP_NAME" > "current-id.txt"

touch $JOBFILE
touch "last-id.txt"

if cmp -s last-id.txt current-id.txt; then
  #Son iguales, me cargo el nuevo
  echo "No hay novedades..."
  echo -e "\nSin novedades. Última actualización: $(date +%d/%m/%Y-%H:%M:%S)" >> "$JOBFILE"

  rm current-id.txt

else
  #Hay novedades, las guardo
  echo "¡Guardando novedades!"

  i=2

  until cmp -s last-id.txt current-id.txt; do
    echo -e "\n------------------------------\n" >> $JOBFILE

    pup ".miniresumen2:nth-child($i) .clearfix span text{}" < "$HTML_TMP_NAME" | sed 's/^/ID: /' >> $JOBFILE
    pup ".miniresumen2:nth-child($i) h2 text{}" < "$HTML_TMP_NAME" | sed 's/^/Oferta: /' >> $JOBFILE
    pup ".miniresumen2:nth-child($i) .iconicos text{}" < "$HTML_TMP_NAME" | sed \
      -e '1s/^[[:space:]]*/Ciudad: /' \
      -e '2s/^[[:space:]]*/Plazas: /' \
      -e '3s/^[[:space:]]*/Fechas: /' >> $JOBFILE

    ((++i))
    pup ".miniresumen2:nth-child($i) .clearfix span text{}" < "$HTML_TMP_NAME" > "current-id.txt"

  done
  
  echo "¡Recuperación de ofertas terminada!"
  echo "Se han obtenido $((i - 2)) ofertas nuevas"

  rm "current-id.txt"

  #Actualizo last-id
  pup '.miniresumen2:first-of-type .clearfix span text{}' < "$HTML_TMP_NAME" > "last-id.txt"
fi

rm "$HTML_TMP_NAME"
