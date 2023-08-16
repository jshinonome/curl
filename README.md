# curl

## GET

deserialize `get` json result

```q
url:"https://reqres.in/api/users/2";
.j.k .curl.Get[url;();""]
```

output result to a file

```q
url:"https://reqres.in/api/users/2";
.curl.Get[url;();"/tmp/user.json"]
```

## PUT

```q
url:"https://reqres.in/api/users/2";
headers:.curl.header.BuildContentType[.curl.contentType.Json;1b];
data:`name`job!`Saitama`Hero;
.curl.Put[url;headers;data]
```

## POST

```q
url:"https://reqres.in/api/users";
headers:.curl.header.BuildContentType[.curl.contentType.Json;1b];
headers:.curl.header.BuildBearer "some_token";
data:`name`job!`Saitama`Hero;
.curl.Post[url;headers;data]
```

## DELETE

```q
url:"https://reqres.in/api/users/2";
.curl.Delete[url;()]
```
