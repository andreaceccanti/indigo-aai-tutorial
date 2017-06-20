local opts = {
    introspection_endpoint = os.getenv("OID_INTROSPECTION_ENDPOINT"),
    client_id = os.getenv("OID_CLIENT_ID"),
    client_secret = os.getenv("OID_CLIENT_SECRET"),
    introspection_token_param_name="token",
    expiry_claim = "exp"
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

oidc = require("resty.openidc")

-- introspect JWT access token
res, err = oidc.introspect(opts)

if err then
    ngx.status = 403
    ngx.say(err)
    ngx.exit(ngx.HTTP_FORBIDDEN)
end

ngx.say("Access granted!\n")
ngx.say("Introspection claims: \n")

print_table(res)
