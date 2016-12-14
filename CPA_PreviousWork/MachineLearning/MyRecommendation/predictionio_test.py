
import predictionio

client = predictionio.EventClient(
    access_key="V2I2F1uBODbwmO9HO3oCiWdU9N4SDRDhPslp7W6vuP14P7uQkU_79tbQFCTPzHdh",
    url="http://0.0.0.0:7070",
    threads=5,
#    qsize=500
)

# A user rates an item
client.create_event(
    event="rate",
    entity_type="user",
    entity_id="001",
    target_entity_type="itemfire",
    target_entity_id="i0",
    properties= { "rating" : float(5.0) }
)

# curl -i -X POST http://localhost:7070/events.json?accessKey=V2I2F1uBODbwmO9HO3oCiWdU9N4SDRDhPslp7W6vuP14P7uQkU_79tbQFCTPzHdh \
# -H "Content-Type: application/json" \
# -d '{
#   "event" : "rate",
#   "entityType" : "user",
#   "entityId" : "u0",
#   "targetEntityType" : "item",
#   "targetEntityId" : "i0",
#   "properties" : {
#     "rating" : 5
#   }
#   "eventTime" : "2014-11-02T09:39:45.618-08:00"
# }'
# HTTP/1.1 201 Created
# Server: spray-can/1.3.3
# Date: Tue, 08 Nov 2016 21:54:27 GMT
# Content-Type: application/json; charset=UTF-8
# Content-Length: 46

# {"eventId":"345bdbd1eaf14db095289a2c0962495f"}MyRecommendation


# MyRecommendation $ curl -i -X POST http://localhost:7070/events.json?accessKey=V2I2F1uBODbwmO9HO3oCiWdU9N4SDRDhPslp7W6vuP14P7uQkU_79tbQFCTPzHdh \
# > -H "Content-Type: application/json" \
# > -d '{
# >   "event" : "buy",
# >   "entityType" : "user",
# >   "entityId" : "u1",
# >   "targetEntityType" : "item",
# >   "targetEntityId" : "i2",
# >   "eventTime" : "2014-11-10T12:34:56.123-08:00"
# > }'
# HTTP/1.1 201 Created
# Server: spray-can/1.3.3
# Date: Tue, 08 Nov 2016 21:56:37 GMT
# Content-Type: application/json; charset=UTF-8
# Content-Length: 46

# {"eventId":"c1a45b42fbdd40209b740b63f9551648"}


# http://localhost:7070/events.json?accessKey=&lt;YOUR_ACCESS_KEY
# curl -i -X GET "http://localhost:7070/events.json?accessKey=V2I2F1uBODbwmO9HO3oCiWdU9N4SDRDhPslp7W6vuP14P7uQkU_79tbQFCTPzHdh"

# HTTP/1.1 200 OK
# Server: spray-can/1.3.3
# Date: Tue, 08 Nov 2016 22:00:36 GMT
# Content-Type: application/json; charset=UTF-8
# Content-Length: 506

# [{"eventId":"345bdbd1eaf14db095289a2c0962495f","event":"rate","entityType":"user","entityId":"u0","targetEntityType":"item","targetEntityId":"i0","properties":{"rating":5},"eventTime":"2014-11-02T09:39:45.618-08:00","creationTime":"2016-11-08T21:54:27.502Z"},
#  {"eventId":"c1a45b42fbdd40209b740b63f9551648","event":"buy","entityType":"user","entityId":"u1","targetEntityType":"item","targetEntityId":"i2","properties":{},"eventTime":"2014-11-10T12:34:56.123-08:00","creationTime":"2016-11-08T21:56:37.556Z"}]

