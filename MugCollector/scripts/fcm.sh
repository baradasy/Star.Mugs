curl --header "Content-Type: application/json" --header "Authorization: key=AAAALpCliVg:APA91bGlLHMVJCGo2ua3dLggUQXYkmSRqcYSb0c-b9MjhSt1qHddkKVjogLnRjCN2TjM9_1rF0yFAMaD_mSlMV76D1o1zD3cQphKHrtiWfezThz0F1DoPBze8UYJ75TzeGnRsaMIU8BX" https://fcm.googleapis.com/fcm/send \
-d '{"notification": {"body": "Hello from curl via FCM!", "sound": "default"},
"priority": "high",
"to": "dTwhVDp9GKI:APA91bEnDineQRUCO6sRlG6nhgsrfo4ZyI_BH2FBOMTChYo_FiTdt5-YeP5pObBcp8pSRC6ezGFockCZgKH-7PsLh-CVB-ELdnotKoEXboJRCYKBSboEtadaI8azM-oUBaPltJQDgA8a"}'
