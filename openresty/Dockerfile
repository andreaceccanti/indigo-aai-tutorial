FROM openresty/openresty:1.11.2.2-alpine

ENV \
 SESSION_VERSION=2.17 \
 HTTP_VERSION=0.10 \
 OPENIDC_VERSION=1.3.2 \
 JWT_VERSION=0.1.10 \
 OID_DISCOVERY=https://iam-test.indigo-datacloud.eu/.well-known/openid-configuration \
 OID_REDIRECT_PATH=/redirect-uri \
 OID_INTROSPECTION_ENDPOINT=https://iam-test.indigo-datacloud.eu/introspect \
 OID_SESSION_SECRET=session_secret \
 OID_SESSION_CHECK_SSI=false \
 OID_SESSION_NAME=iam-test \
 NGINX_RESOLVER=8.8.8.8

RUN \
 apk update && apk upgrade && apk add curl && \
 apk add dnsmasq && \
 cd /tmp && \
 curl -sSL https://github.com/bungle/lua-resty-session/archive/v${SESSION_VERSION}.tar.gz | tar xz && \
 curl -sSL https://github.com/pintsized/lua-resty-http/archive/v${HTTP_VERSION}.tar.gz | tar xz  && \
 curl -sSL https://github.com/pingidentity/lua-resty-openidc/archive/v${OPENIDC_VERSION}.tar.gz | tar xz && \
 curl -sSL https://github.com/SkyLothar/lua-resty-jwt/releases/download/v${JWT_VERSION}/lua-resty-jwt-${JWT_VERSION}.tar.gz | tar xz && \
 cp -r /tmp/lua-resty-session-${SESSION_VERSION}/lib/resty/* /usr/local/openresty/lualib/resty/ && \
 cp -r /tmp/lua-resty-http-${HTTP_VERSION}/lib/resty/* /usr/local/openresty/lualib/resty/ && \
 cp -r /tmp/lua-resty-openidc-${OPENIDC_VERSION}/lib/resty/* /usr/local/openresty/lualib/resty/ && \
 cp -r /tmp/lua-resty-jwt-${JWT_VERSION}/lib/resty/* /usr/local/openresty/lualib/resty/ && \
 rm -rf /tmp/* && \
 mkdir -p /usr/local/openresty/nginx/conf/hostsites/ && \
 true

COPY nginx /usr/local/openresty/nginx/
COPY ca-certificates/*.pem /usr/local/share/ca-certificates/
RUN update-ca-certificates
