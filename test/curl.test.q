import{"../src/curl.q"};

.kest.BeforeAll[{
  .tmp.file:"/tmp/",(,/)string md5 string .z.d;
 }];

.kest.AfterAll[{
  hdel hsym`$.tmp.file;
 }]

.kest.Test["test get";{
  url:"https://reqres.in/api/users/2";
  `data in key .j.k .curl.Get[url;();""]
 }];

.kest.Test["test get as a file";{
  url:"https://reqres.in/api/users/2";
  .curl.Get[url;();.tmp.file];
  -11h=type key hsym `$.tmp.file
 }];

.kest.Test["test post";{
  url:"https://reqres.in/api/users";
  headers:.curl.header.BuildContentType[.curl.contentType.Json;1b];
  data:`name`job!`Saitama`Hero;
  `id in key .j.k .curl.Post[url;headers;data]
 }];

.kest.Test["test delete";{
  url:"https://reqres.in/api/users/2";
  0h=type .curl.Delete[url;()]
 }];

.kest.Test["test put";{
  url:"https://reqres.in/api/users/2";
  headers:.curl.header.BuildContentType[.curl.contentType.Json;1b];
  data:`name`job!`Saitama`Hero;
  `updatedAt in key .j.k .curl.Put[url;headers;data]
 }];
