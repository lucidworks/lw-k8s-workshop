
# Lab 2
This text:
```
Throughout this lab, replace efordelon with the release you used in lab1 (-r) and efordelon.lucidworksproserve.com with the hostname you provided in lab1 (-h).
```
The release is not efordelon, it should be 5.0.2   


## Step 5
The curl command has dns hostname.
```
curl -u admin:<PASSWORD> "https://efordelon.lucidworksproserve.com/api/apps/lab1/query/lab1?q=*:*"

```
Due to no ingress, and DNS steps, needed to use IP instead
