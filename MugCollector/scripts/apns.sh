curl --http2 --cert ./Push_Distribution.pem -H "apns-topic: com.sjdevs.practice.MugCollector" \
-d '{"aps":{"alert":"Hi from APNs","sound":"default"}}' \
https://api.development.push.apple.com/3/device/5927e4a5ef5c5c4e9bf83d8f49b9380f40472207a14ecb3e5a7284cd5a4bba1e
