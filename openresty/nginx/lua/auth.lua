local opts = {
    redirect_uri_path = os.getenv("OID_REDIRECT_PATH"),
    discovery = os.getenv("OID_DISCOVERY"),
    client_id = os.getenv("OID_CLIENT_ID"),
    client_secret = os.getenv("OID_CLIENT_SECRET"),
    scope = "openid profile email"
}

local function print_table(t) 
    for k,v in pairs(t) do
       if (type(v) == "table") then
	   if ("external_authn" == k) then
	     ngx.say(k, " : ");
	     for vk,vv in pairs(v) do
		 ngx.say("\t ", vk, " : ", vv);
	     end
	   else
	     ngx.say(k, " : ", table.concat(v, ", "))
	   end
       else
	    ngx.say(k, " : ", v)
       end
    end
end

-- call authenticate for OpenID Connect user authentication
local res, err = require("resty.openidc").authenticate(opts)

if err then
    ngx.status = 500
    ngx.header.content_type = 'text/html'

    ngx.say("There was an error while logging in: ".. err)
    ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
end

ngx.say("Hello, ", res.user.name, "!\n")
ngx.say("ID token claims: \n")

print_table(res.id_token)

ngx.say("\nUserinfo claims: \n")

print_table(res.user)

ngx.say("\nAccess token: \n")
ngx.say(res.access_token)
