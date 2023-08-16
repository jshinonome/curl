.curl.contentType.Html:"text/html";
.curl.contentType.Csv:"text/comma-separated-values";
.curl.contentType.Plain:"text/plain";
.curl.contentType.Zip:"application/x-compressed";
.curl.contentType.Json:"application/json";

.curl.header.BuildContentType:{[contentType;useUtf8]
  enlist "Content-Type: ",contentType,$[useUtf8;"charset=utf-8";""]
  };

.curl.header.BuildBearer:{[token]enlist "Authorization: Bearer ",token};

.curl.Get:{[url;headers;path]
  .curl.base["GET";url;headers;();path]
 };

.curl.Put:{[url;headers;data]
  .curl.base["PUT";url;headers;data;""]
 };

.curl.Post:{[url;headers;data]
  .curl.base["POST";url;headers;data;""]
 };

.curl.Delete:{[url;headers]
  .curl.base["DELETE";url;headers;();""]
 };

.curl.base:{[method;url;headers;data;path]
  cmd:("curl";"-X";method);
  if[count headers;
    cmd,:(,/){("-H";"'",x,"'")}each headers;
  ];
  if[count data;
    cmd,:("-d";"'",$[10h=type data;data;.j.j data],"'");
  ];
  if[count path;
    cmd,:("-o";"'",path,"'");
  ];
  cmd,:"'",url,"'";
  -1 cmd:" " sv cmd;
  first system cmd
 };
