#sekce přesných slov

dir C:\PM_search | ForEach-Object {

$primefile = (echo "$_") 
echo $primefile
#jedeme popořadě
$filecontent = (Get-Content C:\PM_search\${primefile}) 
foreach ($file in $filecontent) 
{
#1 pravidlo
if ($file -match "\d\d\d\d\d\dF") { Write-Color "1.p IVF *****F" -Color Green
echo $file }
#2 pravidlo
if ($file -match "\d\d\d\d\d\dV") { Write-Color "2.p VISION *****V" -Color Green
echo $file  }

#3 pravidlo
if ($file -match "\d\d\d\d\d\dC") { Write-Color "3.p COSMETICS *****C" -Color Green
echo $file }
if ($file -match "\d\d\d\d\d\dB") { Write-Color "3.p  COSMETICS *****B" -Color Green
echo $file }
#4 pravidlo

if ($file -match " \d\d\d\d\d\dD ") { Write-Color "4.p Dentistry *****D" -Color Green
echo $file }

#5 pravidlo - vision
if ($file -match "01.1238") { Write-Color "5.p VISION 01.1238" -Color Green
echo $file }
if ($file -match "01.1104") { Write-Color "5.p VISION 01.1104"  -Color Green
echo $file}
if ($file -match "relex") { Write-Color "5.p VISION relex"  -Color Green
echo $file}
if ($file -match "linsenaustausch") { Write-Color "5.p VISION linsenaustausch"  -Color Green
echo $file}
if ($file -match "focal") { Write-Color "5.p VISION focal"  -Color Green
echo $file}
if ($file -match "trifocal") { Write-Color "5.p VISION trifocal"  -Color Green
echo $file}
if ($file -match "lens") { Write-Color "5.p VISION lens"  -Color Green
echo $file}
if ($file -match "multi focal") { Write-Color "5.p VISION multi focal"  -Color Green
echo $file}
if ($file -match "bifocal") { Write-Color "5.p VISION bifocal"  -Color Green
echo $file}
if ($file -match "Einäugigkeit") { Write-Color "5.p VISION Einäugigkeit"  -Color Green
echo $file}
if ($file -match "LASIK") { Write-Color "5.p VISION LASIK"  -Color Green
echo $file}
if ($file -match "augen") { Write-Color "5.p VISION augen"  -Color Green
echo $file}
if ($file -match "cataract") { Write-Color "5.p VISION cataract"  -Color Green
echo $file}
if ($file -match "VISION") { Write-Color "5.p VISION VISION"  -Color Green
echo $file}



#6 pravidlo - cosmetic
if ($file -match "01.33") { Write-Color "6.p COSMETIC 01.33" -Color Green
echo $file }
if ($file -match "01.0033") { Write-Color "6.p COSMETIC 01.0033" -Color Green
echo $file }
if ($file -match "01.1050") { Write-Color "6.p COSMETIC 01.1050"  -Color Green
echo $file}
if ($file -match "01.1211") { Write-Color "6.p COSMETIC 01.1211" -Color Green
echo $file }
if ($file -match "01.1210") { Write-Color "6.p COSMETIC 01.1210"  -Color Green
echo $file}
if ($file -match "01.1124") { Write-Color "6.p COSMETIC 01.1124" -Color Green
echo $file }
if ($file -match "gastric balloon") { Write-Color "6.p COSMETIC gastric balloon" -Color Green
echo $file }
if ($file -match "gastric sleeve") { Write-Color "6.p COSMETIC gastric sleeve" -Color Green
echo $file }
if ($file -match "magenverkleinerung") { Write-Color "6.p COSMETIC magenverkleinerung" -Color Green
echo $file }
if ($file -match "magenoperation") { Write-Color "6.p COSMETIC magenoperation" -Color Green
echo $file }
if ($file -match "yelit") { Write-Color "6.p COSMETIC yelit" -Color Green
echo $file }
if ($file -match "blite") { Write-Color "6.p COSMETIC blite" -Color Green
echo $file }
if ($file -match "nose job") { Write-Color "6.p COSMETIC nose job" -Color Green
echo $file }
if ($file -match "bodytite") { Write-Color "6.p COSMETIC bodytite" -Color Green
echo $file }
if ($file -match "tummy tuck") { Write-Color "6.p COSMETIC tummy tuck" -Color Green
echo $file }
if ($file -match "bariatric") { Write-Color "6.p COSMETIC bariatric" -Color Green
echo $file }
if ($file -match "cosmetic surgery") { Write-Color "6.p COSMETIC cosmetic surgery" -Color Green
echo $file }
if ($file -match "Rhinoplasty") { Write-Color "6.p COSMETIC Rhinoplasty" -Color Green
echo $file }
if ($file -match "weight loss") { Write-Color "6.p COSMETIC weight loss" -Color Green
echo $file }
if ($file -match "gynecomastia") { Write-Color "6.p COSMETIC gynecomastia" -Color Green
echo $file }
if ($file -match "plastic surgery") { Write-Color "6.p COSMETIC plastic surgery" -Color Green
echo $file }
if ($file -match "facelift") { Write-Color "6.p COSMETIC facelift" -Color Green
echo $file }
if ($file -match "lipo") { Write-Color "6.p COSMETIC lipo" -Color Green
echo $file }
if ($file -match "liposuction") { Write-Color "6.p COSMETIC liposuction" -Color Green
echo $file }
if ($file -match "otoplasty") { Write-Color "6.p COSMETIC otoplasty" -Color Green
echo $file }
if ($file -match "breast") { Write-Color "6.p COSMETIC breast" -Color Green
echo $file }


#7 pravidlo - dentistry
if ($file -match "01.1240") { Write-Color "7.p dentistry 01.1240"  -Color Green
echo $file}
if ($file -match "01.1157") { Write-Color "7.p dentistry 01.1157" -Color Green
echo $file }
if ($file -match "01.1011") { Write-Color "7.p dentistry 01.1011" -Color Green
echo $file }
if ($file -match "01.1193") { Write-Color "7.p dentistry 01.1193" -Color Green
echo $file }
if ($file -match "veneers") { Write-Color "7.p dentistry veneers" -Color Green
echo $file }
if ($file -match "veneer") { Write-Color "7.p dentistry veneers" -Color Green
echo $file }
if ($file -match "holywood smile") { Write-Color "7.p dentistry holywood smile" -Color Green
echo $file }
if ($file -match "teeth") { Write-Color "7.p dentistry teeth" -Color Green
echo $file }
if ($file -match "crown") { Write-Color "7.p dentistry crown" -Color Green
echo $file }
if ($file -match "ceramic") { Write-Color "7.p dentistry ceramic" -Color Green
echo $file }
if ($file -match "DENTISTRY") { Write-Color "7.p dentistry DENTISTRY" -Color Green
echo $file }
if ($file -match "dental") { Write-Color "7.p dentistry dental" -Color Green
echo $file }

#8 pravidlo - IVF
if ($file -match "01.1266") { Write-Color "8.p IVF 01.1266" -Color Green
echo $file }
if ($file -match "01.1204") { Write-Color "8.p IVF 01.1204" -Color Green
echo $file }
if ($file -match "01.1279") { Write-Color "8.p IVF 01.1279"  -Color Green
echo $file}
if ($file -match "01.32") { Write-Color "8.p IVF 01.1232" -Color Green
echo $file }
if ($file -match "01.0032") { Write-Color "8.p IVF 01.1232" -Color Green
echo $file }
if ($file -match "01.1173") { Write-Color "8.p IVF 01.1173" -Color Green
echo $file }
if ($file -match "künstliche Befruchtung") { Write-Color "8.p IVF künstliche Befruchtung" -Color Green
echo $file }
if ($file -match "kuenstliche Befruchtung") { Write-Color "8.p IVF kuenstliche Befruchtung" -Color Green
echo $file }
if ($file -match "same sex") { Write-Color "8.p IVF same sex" -Color Green
echo $file }
if ($file -match "surrogate") { Write-Color "8.p IVF surrogate" -Color Green
echo $file }
if ($file -match "adoption") { Write-Color "8.p IVF adoption" -Color Green
echo $file }
if ($file -match "Eizellen") { Write-Color "8.p IVF Eizellen" -Color Green
echo $file }
if ($file -match "egg freezing") { Write-Color "8.p IVF egg freezing" -Color Green
echo $file }
if ($file -match "eggs") { Write-Color "8.p IVF eggs" -Color Green
echo $file }
if ($file -match "IVF") { Write-Color "8.p IVF IVF" -Color Green
echo $file }
if ($file -match "embryo") { Write-Color "8.p IVF embryo" -Color Green
echo $file }
if ($file -match "donation") { Write-Color "8.p IVF donation" -Color Green
echo $file }
if ($file -match "fertility") { Write-Color "8.p IVF fertility" -Color Green
echo $file }

}

#9 Pravidlo - Paypal faktury, Twillio a DID, a paypal převody
if ($file -match "JustHost") { Write-Color "9.p JustHost" -Color Green
echo $file }
if ($file -match "You sent a payment") { Write-Color "9.p You sent a payment" -Color Green
echo $file }
if ($file -match "'Amount sent") { Write-Color "9.p 'Amount sent" -Color Green
echo $file }
if ($file -match "Activity report available for download") { Write-Color "9.p Activity report available for download" -Color Green
echo $file }
if ($file -match "DID LOGIC") { Write-Color "9.p DID LOGIC" -Color Green
echo $file }
if ($file -match "Twilio") { Write-Color "9.p Twilio" -Color Green
echo $file }

#10 Pravidlo - Paypal - invoice - které zatím neumím třídit
if ($file -match "We sent your invoice") { Write-Color "10.p We sent your invoice" -Color Green
echo $file }
if ($file -match "Notification of a Cleared eCheck Payment") { Write-Color "10.p Notification of a Cleared eCheck Payment" -Color Green
echo $file }
if ($file -match "has just paid for your invoice") { Write-Color "10.p has just paid for your invoice" -Color Green
echo $file }

#11 Pravidlo - (24) MARKETING
if ($file -match "mailchimp") { Write-Color "11.p mailchimp" -Color Green
echo $file }
if ($file -match "AdWords") { Write-Color "11.p AdWords" -Color Green
echo $file }
if ($file -match "Google AdWords") { Write-Color "11.p Google AdWords" -Color Green
echo $file }


#12 pravidlo (38)VISION - problematicke vzory
if ($file -match "duo vize") { Write-Color "12.p duo vize" -Color Green
echo $file }
if ($file -match "eye") { Write-Color "12.p eye" -Color Green
echo $file }

#13 pravidlo (39)COSMETIC - problematicke vzory
if ($file -match "band") { Write-Color "13.p band" -Color Green
echo $file }

#14 pravidlo (40)IVF - problematicke vzory
if ($file -match "FET") { Write-Color "14.p FET" -Color Green
echo $file }


#15 pravidlo (41)MARKETING - problematicke vzory
if ($file -match "newsletter") { Write-Color "15.p newsletter" -Color Green
echo $file }
if ($file -match "facebook") { Write-Color "15.p facebook" -Color Green
echo $file }
if ($file -match "Instagram") { Write-Color "15.p Instagram" -Color Green
echo $file }
if ($file -match "bing") { Write-Color "15.p bing" -Color Green
echo $file }
if ($file -match "SEO") { Write-Color "15.p SEO" -Color Green
echo $file }





Write-Color "

"
}