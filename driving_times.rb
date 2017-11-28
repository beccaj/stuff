require 'mechanize'


# https://www.google.com/maps/dir/3700+North+Capital+of+Texas+Highway,+Austin,+TX+78746,+USA/Austin+Rock+Gym,+Freidrich+Lane+%23300,+Austin,+TX/@30.2828494,-97.8404999,12z/data=!3m1!4b1!4m17!4m16!1m5!1m1!1s0x865b3521d926d8e1:0x1bfb7968d96b2db4!2m2!1d-97.806704!2d30.336973!1m5!1m1!1s0x8644b48295c08aff:0x7425015bf20a2e5c!2m2!1d-97.7477667!2d30.2067032!2m3!6e0!7e2!8j1445353200
@url = "https://www.google.com/maps/dir/3700+North+Capital+of+Texas+Highway,+Austin,+TX+78746,+USA/Austin+Rock+Gym,+Freidrich+Lane+%23300,+Austin,+TX/@30.2828494,-97.8404999,12z/data=!3m1!4b1!4m17!4m16!1m5!1m1!1s0x865b3521d926d8e1:0x1bfb7968d96b2db4!2m2!1d-97.806704!2d30.336973!1m5!1m1!1s0x8644b48295c08aff:0x7425015bf20a2e5c!2m2!1d-97.7477667!2d30.2067032!2m3!6e0!7e2!8j1445353200"
agent = page = Mechanize.new{|a| a.ssl_version, a.verify_mode = 'SSLv3', OpenSSL::SSL::VERIFY_NONE}

page = agent.get(@url)

print page.to_yaml

=begin
#<Mechanize::Page:0x007fa4f375f478>ruby-2.1.2:rebeccag@rebeccag-mbp:~/stuff [master] $ ruby driving_times.rb
--- &3 !ruby/object:Mechanize::Page
meta_content_type:
encoding:
encodings:
-
- US-ASCII
- UTF-8
mech: &1 !ruby/object:Mechanize
  agent: !ruby/object:Mechanize::HTTP::Agent
    allowed_error_codes: []
    conditional_requests: true
    context: *1
    content_encoding_hooks: []
    cookie_jar: !ruby/object:Mechanize::CookieJar
      store: !ruby/object:HTTP::CookieJar::HashStore
        mon_owner:
        mon_count: 0
        mon_mutex: !ruby/object:Mutex {}
        logger:
        gc_threshold: 150
        jar:
          google.com:
            "/":
              PREF: !ruby/object:HTTP::Cookie
                name: PREF
                value: ID=1111111111111111:FF=0:TM=1445281314:LM=1445281314:V=1:S=Ly5TCHzLajOvak9k
                domain: google.com
                for_domain: true
                path: "/"
                secure: false
                httponly: false
                expires: 2015-12-31 16:02:17.000000000 Z
                max_age:
                created_at: 2015-10-19 14:02:09.910655000 -05:00
                accessed_at: &2 2015-10-19 14:02:09.912755000 -05:00
              NID: !ruby/object:HTTP::Cookie
                name: NID
                value: 72=Pc72rO6noZZw3dRk5nFIjWJN0Gnmxrp3iu4QZphR6V7vtMEf1vPW5Eeh8MJkGMiza5i_5FoYOiLhaSiwIdpUU7OPMTltfMr8zpDCETneNkW-qRfWgKNztWOsVxMgPfJl
                domain: google.com
                for_domain: true
                path: "/"
                secure: false
                httponly: true
                expires: 2016-04-19 19:01:54.000000000 Z
                max_age:
                created_at: 2015-10-19 14:02:09.911138000 -05:00
                accessed_at: *2
        gc_index: 2
    follow_meta_refresh: false
    follow_meta_refresh_self: false
    gzip_enabled: true
    history: !ruby/array:Mechanize::History
      internal:
      - &4 !ruby/object:Mechanize::Page
        meta_content_type: text/html;charset=utf-8
        encoding:
        encodings:
        -
        - US-ASCII
        - UTF-8
        - utf-8
        mech: *1
        bases:
        forms:
        frames:
        iframes:
        links:
        labels:
        labels_hash:
        meta_refresh:
        parser:
        title:
        uri: !ruby/object:URI::HTTPS
          scheme: https
          user:
          password:
          host: www.google.com
          port: 443
          path: "/maps/dir/3700+North+Capital+of+Texas+Highway,+Austin,+TX+78746,+USA/Austin+Rock+Gym,+Freidrich+Lane+%23300,+Austin,+TX/@30.2828494,-97.8404999,12z/data=!3m1!4b1!4m17!4m16!1m5!1m1!1s0x865b3521d926d8e1:0x1bfb7968d96b2db4!2m2!1d-97.806704!2d30.336973!1m5!1m1!1s0x8644b48295c08aff:0x7425015bf20a2e5c!2m2!1d-97.7477667!2d30.2067032!2m3!6e0!7e2!8j1445353200"
          query:
          opaque:
          registry:
          fragment:
          parser:
        body: "<HTML><HEAD><meta http-equiv=\"content-type\" content=\"text/html;charset=utf-8\">\n<TITLE>302
          Moved</TITLE></HEAD><BODY>\n<H1>302 Moved</H1>\nThe document has moved\n<A
          HREF=\"https://www.google.com/maps/dir/3700+North+Capital+of+Texas+Highway,+Austin,+TX+78746,+USA/Austin+Rock+Gym,+Freidrich+Lane+%23300,+Austin,+TX/@30.2828494,-97.8404999,12z/data=!3m1!4b1!4m17!4m16!1m5!1m1!1s0x865b3521d926d8e1:0x1bfb7968d96b2db4!2m2!1d-97.806704!2d30.336973!1m5!1m1!1s0x8644b48295c08aff:0x7425015bf20a2e5c!2m2!1d-97.7477667!2d30.2067032!2m3!6e0!7e2!8j1445353200?dg=dbrw&amp;newdg=1\">here</A>.\r\n</BODY></HTML>\r\n"
        code: '302'
        full_path: false
        response: !ruby/hash:Mechanize::Headers
          location: https://www.google.com/maps/dir/3700+North+Capital+of+Texas+Highway,+Austin,+TX+78746,+USA/Austin+Rock+Gym,+Freidrich+Lane+%23300,+Austin,+TX/@30.2828494,-97.8404999,12z/data=!3m1!4b1!4m17!4m16!1m5!1m1!1s0x865b3521d926d8e1:0x1bfb7968d96b2db4!2m2!1d-97.806704!2d30.336973!1m5!1m1!1s0x8644b48295c08aff:0x7425015bf20a2e5c!2m2!1d-97.7477667!2d30.2067032!2m3!6e0!7e2!8j1445353200?dg=dbrw&newdg=1
          cache-control: private
          content-type: text/html; charset=UTF-8
          p3p: CP="This is not a P3P policy! See http://www.google.com/support/accounts/bin/answer.py?hl=en&answer=151657
            for more info."
          date: Mon, 19 Oct 2015 19:01:54 GMT
          server: gws
          content-length: '591'
          x-xss-protection: 1; mode=block
          x-frame-options: SAMEORIGIN
          set-cookie: PREF=ID=1111111111111111:FF=0:TM=1445281314:LM=1445281314:V=1:S=Ly5TCHzLajOvak9k;
            expires=Thu, 31-Dec-2015 16:02:17 GMT; path=/; domain=.google.com, NID=72=Pc72rO6noZZw3dRk5nFIjWJN0Gnmxrp3iu4QZphR6V7vtMEf1vPW5Eeh8MJkGMiza5i_5FoYOiLhaSiwIdpUU7OPMTltfMr8zpDCETneNkW-qRfWgKNztWOsVxMgPfJl;
            expires=Tue, 19-Apr-2016 19:01:54 GMT; path=/; domain=.google.com; HttpOnly
          alternate-protocol: 443:quic,p=1
          alt-svc: quic="www.google.com:443"; p="1"; ma=600,quic=":443"; p="1"; ma=600
        filename: data=!3m1!4b1!4m17!4m16!1m5!1m1!1s0x865b3521d926d8e1_0x1bfb7968d96b2db4!2m2!1d-97.806704!2d30.336973!1m5!1m1!1s0x8644b48295c08aff_0x7425015bf20a2e5c!2m2!1d-97.7477667!2d30.2067032!2m3!6e0!7e2!8j1445353200
      - *3
      ivars:
        :@max_size: 50
        :@history_index:
          ? https://www.google.com/maps/dir/3700+North+Capital+of+Texas+Highway,+Austin,+TX+78746,+USA/Austin+Rock+Gym,+Freidrich+Lane+%23300,+Austin,+TX/@30.2828494,-97.8404999,12z/data=!3m1!4b1!4m17!4m16!1m5!1m1!1s0x865b3521d926d8e1:0x1bfb7968d96b2db4!2m2!1d-97.806704!2d30.336973!1m5!1m1!1s0x8644b48295c08aff:0x7425015bf20a2e5c!2m2!1d-97.7477667!2d30.2067032!2m3!6e0!7e2!8j1445353200
          : *4
          ? https://www.google.com/maps/dir/3700+North+Capital+of+Texas+Highway,+Austin,+TX+78746,+USA/Austin+Rock+Gym,+Freidrich+Lane+%23300,+Austin,+TX/@30.2828494,-97.8404999,12z/data=!3m1!4b1!4m17!4m16!1m5!1m1!1s0x865b3521d926d8e1:0x1bfb7968d96b2db4!2m2!1d-97.806704!2d30.336973!1m5!1m1!1s0x8644b48295c08aff:0x7425015bf20a2e5c!2m2!1d-97.7477667!2d30.2067032!2m3!6e0!7e2!8j1445353200?dg=dbrw&newdg=1
          : *3
    ignore_bad_chunking: false
    keep_alive: true
    max_file_buffer: 100000
    open_timeout:
    post_connect_hooks: []
    pre_connect_hooks: []
    read_timeout:
    redirect_ok: true
    redirection_limit: 20
    request_headers: {}
    robots: false
    user_agent: Mechanize/2.7.3 Ruby/2.1.2p95 (http://github.com/sparklemotion/mechanize/)
    webrobots:
    auth_store: !ruby/object:Mechanize::HTTP::AuthStore
      auth_accounts: {}
      default_auth:
    authenticate_parser: !ruby/object:Mechanize::HTTP::WWWAuthenticateParser
      scanner:
    authenticate_methods:
      ? !ruby/object:URI::HTTPS
        scheme: https
        user:
        password:
        host: www.google.com
        port: 443
        path: "/"
        query:
        opaque:
        registry:
        fragment:
        parser:
      : :digest: []
        :iis_digest: []
        :basic: []
    digest_auth: !ruby/object:Net::HTTP::DigestAuth
      mon_owner:
      mon_count: 0
      mon_mutex: !ruby/object:Mutex {}
      nonce_count: -1
    digest_challenges: {}
    pass:
    scheme_handlers:
      http: &5 !ruby/object:Proc {}
      https: *5
      relative: *5
      file: *5
    http: !ruby/object:Net::HTTP::Persistent
      name: mechanize
      debug_output:
      proxy_uri:
      no_proxy: []
      headers: {}
      override_headers: {}
      http_versions:
        www.google.com:443: '1.1'
      keep_alive: 300
      open_timeout:
      read_timeout:
      idle_timeout: 5
      max_requests:
      socket_options:
      - - 6
        - 1
        - 1
      generation_key: :net_http_persistent_mechanize_generations
      ssl_generation_key: :net_http_persistent_mechanize_ssl_generations
      request_key: :net_http_persistent_mechanize_requests
      timeout_key: :net_http_persistent_mechanize_timeouts
      certificate:
      ca_file:
      private_key:
      ssl_version: SSLv3
      verify_callback:
      verify_mode: 0
      cert_store:
      generation: 1
      ssl_generation: 3
      reuse_ssl_sessions: true
      retry_change_requests: false
      ruby_1: false
      retried_on_ruby_2: true
  log:
  watch_for_set:
  history_added:
  pluggable_parser: !ruby/object:Mechanize::PluggableParser
    parsers:
      text/html: &6 !ruby/class 'Mechanize::Page'
      application/xhtml+xml: *6
      application/vnd.wap.xhtml+xml: *6
      image: !ruby/class 'Mechanize::Image'
      text/xml: &7 !ruby/class 'Mechanize::XmlFile'
      application/xml: *7
    default: !ruby/class 'Mechanize::File'
  keep_alive_time: 0
  proxy_addr:
  proxy_port:
  proxy_user:
  proxy_pass:
  html_parser: !ruby/module 'Nokogiri::HTML'
  default_encoding:
  force_default_encoding: false
bases:
forms:
frames:
iframes:
links:
labels:
labels_hash:
meta_refresh:
parser:
title:
uri: !ruby/object:URI::HTTPS
  scheme: https
  user:
  password:
  host: www.google.com
  port: 443
  path: "/maps/dir/3700+North+Capital+of+Texas+Highway,+Austin,+TX+78746,+USA/Austin+Rock+Gym,+Freidrich+Lane+%23300,+Austin,+TX/@30.2828494,-97.8404999,12z/data=!3m1!4b1!4m17!4m16!1m5!1m1!1s0x865b3521d926d8e1:0x1bfb7968d96b2db4!2m2!1d-97.806704!2d30.336973!1m5!1m1!1s0x8644b48295c08aff:0x7425015bf20a2e5c!2m2!1d-97.7477667!2d30.2067032!2m3!6e0!7e2!8j1445353200"
  query: dg=dbrw&newdg=1
  opaque:
  registry:
  fragment:
  parser:
body: "<!DOCTYPE html>\n<html dir=ltr>\n  <head>\n    <script>\n      mapslite = {\n
  \       START_TIME: new Date()\n      };\n      mapslite.getBasePageResponse = function(cacheResponse)
  {\n        delete mapslite.getBasePageResponse;\n        cacheResponse([[[110252.5768762168,-97.77045915000001,30.28286805],[0,0,0],[1024,768],13.10000038146973],\"https://www.google.com/maps-lite/js/2/23a\",null,null,null,[\"en-US\",\"us\"],[\"/maps/lite/ApplicationService.GetEntityDetails\",\"/maps/lite/ApplicationService.UpdateStarring\",\"/maps/lite/ApplicationService.Search\",null,\"/maps/lite/suggest\",\"/maps/lite/directions\",\"/maps/lite/MapsLiteService.GetHotelAvailability\"],[[[2,\"spotlight\",null,null,null,null,null,[null,null,null,null,null,null,null,[[[\"3700
  N Capital of Texas Hwy\",null,null,null,null,null,null,null,null,null,null,\"Ag4VEqDhs8W0LWvZaHn7G-HYJtkhNVuG\"],[\"Austin
  Rock Gym\",null,null,null,null,null,null,null,null,null,null,\"WC0BEt3fvMVcLgryWwEldP-KwJWCtESG\"]],null,null,0,null,[[null,null,null,null,null,null,null,1],null,null,1,null,[0,0,0,1,null,null,1,null,\"\",null,null,null,null,null,null,null,0,0,null,-1,0,1,1,0,0,1,1,1,0,0],null,null,null,null,null,null,null,null,null,null,[[0],null,null,0],null,[0,2,\"1445353200\"],[null,null,0,null,2],null,null,null,null,null,1],null,[0],null,null,null,null,null,null,null,null,null,null,null,null,\"SCJaXzIuRxIOUBxICdGYdAkmzvSUjPiVW,m9eUjCMOx_rkRn6Z\",null,1445281315],null,null,null,null,[null,null,null,null,null,null,null,null,null,null,null,null,null,1]]]],[[52,[[\"tm\",\"0\"],[\"wide_routes\"],[\"traffic\",\"0\"]]]]],null,null,[[[[\"TX-360
  Loop S\",[20370,\"12.7 miles\",1],[1147,\"19 min\"],0,null,null,[[1320,\"22 min\"],1,3,[1032,\"17
  min\"],[1080,1680,\"18 - 28 min\"],null,null,[\"1445372880\",\"America/Chicago\",\"3:28
  PM\",-18000,\"1445372880\"]],null,null,[null,null,null,[null,null,[null,null,30.2065252,-97.8284493],[null,null,30.336973,-97.74405619999999]]]],[[[null,[20370,\"12.7
  mi\",1],[1147,\"19 min\"],null,null,null,[[1320,\"22 min\"],1,3,[1032,\"17 min\"],[1080,1680,\"18
  - 28 min\"],null]],[[[null,[18568,\"11.5 mi\",1],[909,\"15 min\"],null,null,null,null,null,null,[[[58441.47060461947,-97.78723825,30.27610795],[0,0,0],[1024,768],13.10000038146973]],null,[[2,[\"Take
  \"]],[2,[\"TX-360 Loop S\",1]],[2,[\" to \"]],[2,[\"E Ben White Blvd\",1]],[2,[\".
  Take the exit toward \"]],[2,[\"Woodward Street\",1]],[2,[\"/\"]],[2,[\"Burleson
  Road\",1]],[2,[\"/\"]],[2,[\"Todd Lane\",1]],[2,[\" from \"]],[2,[\"TX-71 E\",1]]]],[[[\"\",[12576,\"7.8
  mi\",1],[688,\"11 min\"],0,null,null,null,null,null,[[[2614.437784468922,-97.8056529,30.3364544],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.33661065557999,-97.80554942283354],[null,null,30.3364544,-97.8056529]],[null,null,30.3364544,-97.8056529],null,[[183.8274343005625,-97.80470180313857,30.33789059336848],[-150.2497253417969,45,0],[1024,768],60],[\"Zcrk0XxZJlH0wVfQN9zyhQ\",0,1,null,null,336.9537353515625,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=Zcrk0XxZJlH0wVfQN9zyhQ\\u0026w=203\\u0026h=100\\u0026yaw=213\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.336624,-97.805540\",\"\",null,[203,100]],null,[[3,-97.80554033599437,30.33662434848343],[213.5181732177734,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CAYQ9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3DZcrk0XxZJlH0wVfQN9zyhQ\\u0026sa=U\\u0026ved=0CAcQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNEFBPu-Uhw9xV3bY-oSC7tT00hUyQ\",null,null,\"0CAcQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"Zcrk0XxZJlH0wVfQN9zyhQ\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.33662434848343,-97.80554033599437]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=Zcrk0XxZJlH0wVfQN9zyhQ\"]],2]],null,[[2,[\"Head
  \"]],[2,[\"southwest\",1]],[2,[\" on \"]],[2,[\"TX-360 Loop S\",1]],[2,[\" toward
  \"]],[2,[\"Westlake Dr\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],534,0],0]]]],[[\"\\u003cstep
  maneuver='ON_RAMP' meters='939'\\u003eTake the \\u003csignlist\\u003e\\u003csign
  lang='en'\\u003eU.S. 290 E\\u003c/sign\\u003e\\u003c/signlist\\u003e ramp on the
  \\u003cturn side='LEFT'\\u003eleft\\u003c/turn\\u003e\\u003c/step\\u003e\",[939,\"0.6
  mi\",1],[37,\"37 s\"],0,null,null,null,null,null,[[[2614.437784462281,-97.79947500000002,30.2385354],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.238700731615,-97.7995573148914],[null,null,30.2385354,-97.79947500000002]],[null,null,30.2385354,-97.79947500000002],null,[[183.8274343000956,-97.80023158593033,30.24005501218518],[156.7258148193359,45,0],[1024,768],60],[\"6jZwt5rwtIbslilDxwXj9A\",0,1,null,null,426.3984985351562,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=6jZwt5rwtIbslilDxwXj9A\\u0026w=203\\u0026h=100\\u0026yaw=153\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.238650,-97.799532\",\"\",null,[203,100]],null,[[3,-97.7995320933542,30.23865003702106],[153.5250396728516,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CAkQ9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3D6jZwt5rwtIbslilDxwXj9A\\u0026sa=U\\u0026ved=0CAoQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNEBHgwqYlZNBAPjSdXex-TGaMuDyg\",null,null,\"0CAoQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"6jZwt5rwtIbslilDxwXj9A\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.23865003702106,-97.7995320933542]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=6jZwt5rwtIbslilDxwXj9A\"]],2]],null,[[2,[\"Take
  the \"]],[2,[\"U.S. 290 E\",1]],[2,[\"/\"]],[2,[\"Texas 71 E\",1]],[2,[\" ramp on
  the \"]],[14,[\"left\",1]],[2,[\" to \"]],[2,[\"Bastrop\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],143,0],0]]]],[[\"\",[3518,\"2.2
  mi\",1],[124,\"2 min\"],0,null,null,null,null,null,[[[2614.437784467607,-97.79339650000001,30.2323229],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.23242013201553,-97.79357179395342],[null,null,30.2323229,-97.7933965]],[null,null,30.2323229,-97.7933965],null,[[183.8274343004701,-97.79500769034607,30.23321659112346],[122.7003631591797,45,0],[1024,768],60],[\"W_HgE8hK5MB9gpd_UpKBXg\",0,1,null,null,393.9306335449219,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=W_HgE8hK5MB9gpd_UpKBXg\\u0026w=203\\u0026h=100\\u0026yaw=119\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.232417,-97.793566\",\"\",null,[203,100]],null,[[3,-97.79356600015402,30.23241688756095],[119.00830078125,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CAwQ9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3DW_HgE8hK5MB9gpd_UpKBXg\\u0026sa=U\\u0026ved=0CA0Q-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNFV-dr38zxVQ7K22Tjw5UgWoSCM4Q\",null,null,\"0CA0Q-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"W_HgE8hK5MB9gpd_UpKBXg\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.23241688756095,-97.79356600015402]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=W_HgE8hK5MB9gpd_UpKBXg\"]],2]],null,[[2,[\"Merge
  onto \"]],[2,[\"US-290 E\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],143,0],0]]]],[[\"\",[1276,\"0.8
  mi\",1],[44,\"44 s\"],0,null,null,null,null,null,[[[2614.437784466286,-97.76038130000001,30.2208753],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.22096410726684,-97.76056246215127],[null,null,30.2208753,-97.76038130000001]],[null,null,30.2208753,-97.76038130000001],null,[[183.8274343003772,-97.76204643165956,30.22169155904615],[119.5667343139648,45,0],[1024,768],60],[\"F_eu2o9OeTtWs9ft_hOdjw\",0,1,null,null,404.41796875,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=F_eu2o9OeTtWs9ft_hOdjw\\u0026w=203\\u0026h=100\\u0026yaw=116\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.220972,-97.760579\",\"\",null,[203,100]],null,[[3,-97.76057937175233,30.22097241357142],[116.1184768676758,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CA8Q9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3DF_eu2o9OeTtWs9ft_hOdjw\\u0026sa=U\\u0026ved=0CBAQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNHh2l-WG6i3KDheQ-JsAaEcGnSpdg\",null,null,\"0CBAQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"F_eu2o9OeTtWs9ft_hOdjw\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.22097241357142,-97.76057937175233]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=F_eu2o9OeTtWs9ft_hOdjw\"]],2]],null,[[2,[\"Continue
  onto \"]],[2,[\"TX-71 E\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],534,0],0]]]],[[\"\\u003cstep
  maneuver='OFF_RAMP' meters='259'\\u003eTake the exit toward \\u003csignlist\\u003e\\u003csign
  lang='en'\\u003eWoodward Street\\u003c/sign\\u003e\\u003c/signlist\\u003e\\u003c/step\\u003e\",[259,\"0.2
  mi\",1],[16,\"16 s\"],0,null,null,null,null,null,[[[2614.437784469382,-97.74862879999999,30.21619510000001],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.21619438046231,-97.74883707345342],[null,null,30.2161951,-97.74862879999999]],[null,null,30.2161951,-97.74862879999999],null,[[183.8274343005949,-97.75054311876086,30.21618848646148],[89.77093505859375,45,0],[1024,768],60],[\"RBRFGldSObwpT1zBV7EoIA\",0,1,null,null,462.1402282714844,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=RBRFGldSObwpT1zBV7EoIA\\u0026w=203\\u0026h=100\\u0026yaw=89\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.216194,-97.748816\",\"\",null,[203,100]],null,[[3,-97.74881607512275,30.21619444146483],[89.79852294921875,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CBIQ9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3DRBRFGldSObwpT1zBV7EoIA\\u0026sa=U\\u0026ved=0CBMQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNHbVf_BuEttCQZRGumCGRau25ITgg\",null,null,\"0CBMQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"RBRFGldSObwpT1zBV7EoIA\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.21619444146483,-97.74881607512275]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=RBRFGldSObwpT1zBV7EoIA\"]],2]],null,[[2,[\"Take
  the exit toward \"]],[2,[\"Woodward Street\",1]],[2,[\"/\"]],[2,[\"Burleson Road\",1]],[2,[\"/\"]],[2,[\"Todd
  Lane\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],429,0],0]]]]],null,0],[[null,[1802,\"1.1
  mi\",1],[238,\"4 min\"],null,null,null,null,null,null,[[[4478.079466511741,-97.74754479999999,30.21114925],[0,0,0],[1024,768],13.10000038146973]],null,[[2,[\"Take
  \"]],[2,[\"Woodward St\",1]],[2,[\" and \"]],[2,[\"Freidrich Ln\",1]],[2,[\" to
  your destination\"]]]],[[[\"\",[190,\"0.1 mi\",1],[34,\"34 s\"],0,null,null,null,null,null,[[[2614.437784465806,-97.7460272,30.21576150000001],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.21581185423524,-97.74622514186825],[null,null,30.2157615,-97.7460272]],[null,null,30.2157615,-97.7460272],null,[[183.8274343003435,-97.74786360483918,30.21622866021323],[106.4036560058594,45,0],[1024,768],60],[\"wGK5x1mfp7BNsznHnuU1dg\",0,1,null,null,512.2845458984375,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=wGK5x1mfp7BNsznHnuU1dg\\u0026w=203\\u0026h=100\\u0026yaw=104\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.215812,-97.746230\",\"\",null,[203,100]],null,[[3,-97.74623037607428,30.21581231043503],[104.0406036376953,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CBYQ9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3DwGK5x1mfp7BNsznHnuU1dg\\u0026sa=U\\u0026ved=0CBcQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNEaT9j74LPY7yCE2lYVEsbiHcDlrw\",null,null,\"0CBcQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"wGK5x1mfp7BNsznHnuU1dg\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.21581231043503,-97.74623037607428]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=wGK5x1mfp7BNsznHnuU1dg\"]],2]],null,[[2,[\"Merge
  onto \"]],[2,[\"E Ben White Blvd\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],143,0],0]]]],[[\"\",[306,\"0.2
  mi\",1],[35,\"35 s\"],0,null,null,null,null,null,[[[2614.437784472431,-97.74405619999999,30.2157191],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.21573315347385,-97.74426383823671],[null,null,30.2157191,-97.74405619999999]],[null,null,30.2157191,-97.74405619999999],null,[[183.8274343008092,-97.74596467984678,30.21584827060157],[94.47848510742188,45,0],[1024,768],60],[\"UkDRVZsxJPNHLLToLklUfg\",0,1,null,null,503.7284545898438,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=UkDRVZsxJPNHLLToLklUfg\\u0026w=203\\u0026h=100\\u0026yaw=93\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.215732,-97.744251\",\"\",null,[203,100]],null,[[3,-97.74425119045935,30.2157323046736],[93.87413024902344,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CBkQ9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3DUkDRVZsxJPNHLLToLklUfg\\u0026sa=U\\u0026ved=0CBoQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNG-iga2g6_JQ4sKLon3PVrQC8mFvg\",null,null,\"0CBoQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"UkDRVZsxJPNHLLToLklUfg\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.2157323046736,-97.74425119045935]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=UkDRVZsxJPNHLLToLklUfg\"]],2]],null,[[2,[\"Turn
  \"]],[14,[\"right\",1]],[2,[\" onto \"]],[2,[\"Woodward St\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],483,0],0]]]],[[\"\",[951,\"0.6
  mi\",1],[96,\"2 min\"],0,null,null,null,null,null,[[[2614.437784458929,-97.745417,30.2132464],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.21340523182344,-97.74531905175088],[null,null,30.2132464,-97.745417]],[null,null,30.2132464,-97.745417],null,[[183.8274342998599,-97.74451672344115,30.21470626909736],[-151.9464874267578,45,0],[1024,768],60],[\"CWD8TmRFhuXFRJCrsIoDNg\",0,1,null,null,345.6803588867188,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=CWD8TmRFhuXFRJCrsIoDNg\\u0026w=203\\u0026h=100\\u0026yaw=211\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.213385,-97.745332\",\"\",null,[203,100]],null,[[3,-97.74533174912179,30.21338464226939],[211.6611938476562,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CBwQ9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3DCWD8TmRFhuXFRJCrsIoDNg\\u0026sa=U\\u0026ved=0CB0Q-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNGzWloo7UzTwbin3oeONOAW_EDkng\",null,null,\"0CB0Q-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"CWD8TmRFhuXFRJCrsIoDNg\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.21338464226939,-97.74533174912179]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=CWD8TmRFhuXFRJCrsIoDNg\"]],2]],null,[[2,[\"Turn
  \"]],[14,[\"right\",1]],[2,[\" onto \"]],[2,[\"Freidrich Ln\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],483,0],0]]]],[[\"\",[120,\"394
  ft\",1],[25,\"25 s\"],0,null,null,null,null,null,[[[2614.437784468795,-97.7510334,30.2078567],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.20801421875472,-97.7509326581097],[null,null,30.2078567,-97.7510334]],[null,null,30.2078567,-97.7510334],null,[[183.8274343005536,-97.75010744536641,30.20930450154757],[-151.0702819824219,45,0],[1024,768],60],[\"OJX2BxwVREsamv6NAmoTYg\",0,1,null,null,515.4652099609375,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=OJX2BxwVREsamv6NAmoTYg\\u0026w=203\\u0026h=100\\u0026yaw=212\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.208028,-97.750924\",\"\",null,[203,100]],null,[[3,-97.75092388002835,30.2080278672752],[212.6128082275391,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CB8Q9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3DOJX2BxwVREsamv6NAmoTYg\\u0026sa=U\\u0026ved=0CCAQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNExn8S9JV-gid3ZNmvgpsSAINdlAQ\",null,null,\"0CCAQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"OJX2BxwVREsamv6NAmoTYg\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.2080278672752,-97.75092388002835]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=OJX2BxwVREsamv6NAmoTYg\"]],2]],null,[[2,[\"Turn
  \"]],[14,[\"left\",1]],[2,[\" at \"]],[2,[\"Sponberg Dr\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],413,0],0]]]],[[\"\",[182,\"0.1
  mi\",1],[23,\"23 s\"],0,null,null,null,null,null,[[[2614.43778447272,-97.74994180000002,30.2073342],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.20742421095895,-97.75012213853559],[null,null,30.2073342,-97.7499418]],[null,null,30.2073342,-97.7499418],null,[[183.8274343008295,-97.75159937120354,30.20816152741613],[120.0084686279297,45,0],[1024,768],60]],null,[[2,[\"Continue
  straight\"]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],534,0],0]]]],[[\"\",[18,\"59
  ft\",1],[11,\"11 s\"],0,null,null,null,null,null,[[[2614.437784461822,-97.7482873,30.2065332],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.2066211616429,-97.74846898856201],[null,null,30.2065332,-97.7482873]],[null,null,30.2065332,-97.7482873],null,[[183.8274343000633,-97.74995726175909,30.20734168260655],[119.2575378417969,45,0],[1024,768],60]],null,[[2,[\"Turn
  \"]],[14,[\"left\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],413,0],0]]]],[[\"\\u003cstep
  maneuver='TURN' meters='35'\\u003eTurn \\u003cturn side='RIGHT'\\u003eright\\u003c/turn\\u003e\\u003c/step\\u003e\",[35,\"115
  ft\",1],[14,\"14 s\"],0,null,null,null,null,[[null,\"Destination will be on the
  left\",null,null,null,null,null,null,8,null,null,null,null,null,null,1]],[[[2614.437784454084,-97.74819540000001,30.2066761],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.2065332,-97.7482873],[null,null,30.2066761,-97.7481954]],[null,null,30.2066761,-97.7481954],null,[[183.8274342995192,-97.74912528484799,30.20523016502267],[29.06460189819336,45,0],[1024,768],60]],null,[[2,[\"Turn
  \"]],[14,[\"right\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],483,0],0]]]]],null,0]]]]],[[null,[28117,\"17.5
  miles\",1],[5597,\"1 h 34 min\",5640],3,[[\"1445374067\",\"America/Chicago\",\"3:47
  PM\",-18000,\"1445374020\"],[\"1445379664\",\"America/Chicago\",\"5:21 PM\",-18000,\"1445379660\"],null,null,[\"1445374067\",\"America/Chicago\",\"3:47
  PM\",-18000,\"1445374020\"],[\"1445379664\",\"America/Chicago\",\"5:21 PM\",-18000,\"1445379660\"]],[null,null,null,null,[[\"Capital
  Metro\",\"3508131340849202367\",null,null,\"1 512-474-1200\",null,null,[\"/url?q=http://www.capmetro.org/\\u0026sa=U\\u0026ved=0CCUQvUwoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNEz-vxk9RiqqKpmZkHhN0Z-I0xxbw\",null,null,\"0CCUQvUwoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],[\"/url?q=http://www.capmetro.org/fares/\\u0026sa=U\\u0026ved=0CCYQkFwoATAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNFQ1tWq_-9Vs8f5n7JQTGE2f-FYag\",\"Ticket
  information\",null,\"0CCYQkFwoATAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"]]]],null,null,null,[null,null,null,[null,null,[null,null,30.2065252,-97.806704],[null,null,30.3592109,-97.727037]]],[2.5,\"$2.50\",\"USD\"],[[1,null,[3,\"drive.png\",null,\"Drive\",[[\"https://maps.gstatic.com/mapfiles/transit/iw2/b/drive.png\",0,[15,15],null,0]]]],[9],[4,null,[3,\"bus.png\",null,\"Bus\",[[\"https://maps.gstatic.com/mapfiles/transit/iw2/b/bus.png\",0,[15,15],null,0]]]],[5,[\"19\",1,\"#009ca7\",\"#000000\"]],[9],[4,null,[3,\"bus.png\",null,\"Bus\",[[\"https://maps.gstatic.com/mapfiles/transit/iw2/b/bus.png\",0,[15,15],null,0]]]],[5,[\"7\",1,\"#e11f8f\",\"#000000\"]]]],[[[],[[[null,[8819,\"5.5
  mi\",1],[613,\"11 min\",660],0,null,[],null,null,null,[[[15462.9208917178,-97.78176240000001,30.3471764],[0,0,0],[1024,768],13.10000038146973]],null,[[1,null,[3,\"drive.png\",null,\"Drive\",[[\"https://maps.gstatic.com/mapfiles/transit/iw2/b/drive.png\",0,[15,15],null,0]]]],[2,[\"Drive/Taxi\"]]]],[[[\"\",[138,\"453
  ft\",1],[15,\"15 s\"],0,null,null,null,null,null,[[[2614.437784468922,-97.8056529,30.3364544],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.33661065557999,-97.80554942283354],[null,null,30.3364544,-97.8056529]],[null,null,30.3364544,-97.8056529],null,[[183.8274343005625,-97.80470180313857,30.33789059336848],[-150.2497253417969,45,0],[1024,768],60],[\"Zcrk0XxZJlH0wVfQN9zyhQ\",0,1,null,null,336.9537353515625,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=Zcrk0XxZJlH0wVfQN9zyhQ\\u0026w=203\\u0026h=100\\u0026yaw=213\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.336624,-97.805540\",\"\",null,[203,100]],null,[[3,-97.80554033599437,30.33662434848343],[213.5181732177734,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CCkQ9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3DZcrk0XxZJlH0wVfQN9zyhQ\\u0026sa=U\\u0026ved=0CCoQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNEFBPu-Uhw9xV3bY-oSC7tT00hUyQ\",null,null,\"0CCoQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"Zcrk0XxZJlH0wVfQN9zyhQ\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.33662434848343,-97.80554033599437]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=Zcrk0XxZJlH0wVfQN9zyhQ\"]],2]],null,[[2,[\"Head
  \"]],[2,[\"southwest\",1]],[2,[\" on \"]],[2,[\"TX-360 Loop S\",1]],[2,[\" toward
  \"]],[2,[\"Westlake Dr\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],534,0],0]]]],[[\"\\u003cstep
  maneuver='UTURN' meters='2638'\\u003eMake a \\u003cturn type='UTURN'\\u003eU-turn\\u003c/turn\\u003e
  at \\u003croadlist\\u003e\\u003croad lang='en'\\u003eWestlake Dr\\u003c/road\\u003e\\u003c/roadlist\\u003e\\u003c/step\\u003e\",[2638,\"1.6
  mi\",1],[183,\"3 min\"],0,null,null,null,null,null,[[[2614.437784459305,-97.80636160000002,30.3353732],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.33552998269339,-97.8062591993514],[null,null,30.3353732,-97.80636160000002]],[null,null,30.3353732,-97.80636160000002],null,[[183.8274342998863,-97.80542039907752,30.33681423626154],[-150.5895233154297,45,0],[1024,768],60],[\"qHp2h562k7IXbApmRI_-aA\",0,1,null,null,388.49658203125,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=qHp2h562k7IXbApmRI_-aA\\u0026w=203\\u0026h=100\\u0026yaw=213\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.335491,-97.806285\",\"\",null,[203,100]],null,[[3,-97.80628483774699,30.33549067914215],[213.1610717773438,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CCwQ9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3DqHp2h562k7IXbApmRI_-aA\\u0026sa=U\\u0026ved=0CC0Q-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNH2wedSUbAukHn1LqrPS87qLTqC8A\",null,null,\"0CC0Q-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"qHp2h562k7IXbApmRI_-aA\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.33549067914215,-97.80628483774699]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=qHp2h562k7IXbApmRI_-aA\"]],2]],null,[[2,[\"Make
  a \"]],[14,[\"U-turn\",1]],[2,[\" at \"]],[2,[\"Westlake Dr\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],305,0],0]]]],[[\"\\u003cstep
  maneuver='OFF_RAMP' meters='316'\\u003eTake the \\u003csignlist\\u003e\\u003csign
  lang='en' is_route_number='true'\\u003eRM 2222\\u003c/sign\\u003e\\u003c/signlist\\u003e
  exit\\u003c/step\\u003e\",[316,\"0.2 mi\",1],[18,\"18 s\"],0,null,null,null,null,null,[[[2614.437784477769,-97.79312100000001,30.3555836],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.35542773532633,-97.79322528582357],[null,null,30.3555836,-97.793121]],[null,null,30.3555836,-97.793121],null,[[183.8274343011846,-97.79407953106939,30.35415097855575],[30.00010871887207,45,0],[1024,768],60],[\"M7_HOUQuwbBmpcAUR5W2DA\",0,1,null,null,580.0320434570312,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=M7_HOUQuwbBmpcAUR5W2DA\\u0026w=203\\u0026h=100\\u0026yaw=33\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.355395,-97.793248\",\"\",null,[203,100]],null,[[3,-97.79324756495109,30.35539452713792],[33.79826354980469,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CC8Q9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3DM7_HOUQuwbBmpcAUR5W2DA\\u0026sa=U\\u0026ved=0CDAQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNGGY1YX9HQKMbOqITiM6CtmsHBcHw\",null,null,\"0CDAQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"M7_HOUQuwbBmpcAUR5W2DA\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.35539452713792,-97.79324756495109]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=M7_HOUQuwbBmpcAUR5W2DA\"]],2]],null,[[2,[\"Take
  the \"]],[2,[\"RM 2222\",1]],[2,[\" exit\"]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],429,0],0]]]],[[\"\",[163,\"0.1
  mi\",1],[31,\"31 s\"],0,null,null,null,null,null,[[[2614.437784478283,-97.79117490000002,30.3578558],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.35769438145279,-97.7912671464788],[null,null,30.3578558,-97.7911749]],[null,null,30.3578558,-97.7911749],null,[[183.8274343012207,-97.79202277250623,30.35637213065131],[26.24868965148926,45,0],[1024,768],60],[\"Iq9aiWmwhj8BbmmkW1nAkg\",0,1,null,null,437.5306701660156,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=Iq9aiWmwhj8BbmmkW1nAkg\\u0026w=203\\u0026h=100\\u0026yaw=29\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.357726,-97.791249\",\"\",null,[203,100]],null,[[3,-97.79124914511263,30.35772585365484],[29.7415771484375,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CDIQ9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3DIq9aiWmwhj8BbmmkW1nAkg\\u0026sa=U\\u0026ved=0CDMQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNEH87E6UiUMFrkHMbdGFnCmcncoGQ\",null,null,\"0CDMQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"Iq9aiWmwhj8BbmmkW1nAkg\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.35772585365484,-97.79124914511263]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=Iq9aiWmwhj8BbmmkW1nAkg\"]],2]],null,[[2,[\"Continue
  onto \"]],[2,[\"N Capital of Texas Hwy\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],534,0],0]]]],[[\"\",[5486,\"3.4
  mi\",1],[343,\"6 min\"],0,null,null,null,null,null,[[[2614.437784465454,-97.7905186,30.35921090000001],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.35904360990398,-97.79059552484757],[null,null,30.3592109,-97.7905186]],[null,null,30.3592109,-97.7905186],null,[[183.8274343003187,-97.79122564570686,30.35767326194909],[21.64192771911621,45,0],[1024,768],60],[\"0bmBecM1pqLevJDcIT55Wg\",0,1,null,null,439.5768737792969,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=0bmBecM1pqLevJDcIT55Wg\\u0026w=203\\u0026h=100\\u0026yaw=24\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.359093,-97.790573\",\"\",null,[203,100]],null,[[3,-97.79057298146955,30.3590926196285],[24.69143486022949,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CDUQ9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3D0bmBecM1pqLevJDcIT55Wg\\u0026sa=U\\u0026ved=0CDYQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNGCHqyhWHMbXiD9lP2V4OOP40C-iw\",null,null,\"0CDYQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"0bmBecM1pqLevJDcIT55Wg\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.3590926196285,-97.79057298146955]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=0bmBecM1pqLevJDcIT55Wg\"]],2]],null,[[2,[\"Turn
  \"]],[14,[\"right\",1]],[2,[\" onto \"]],[2,[\"Ranch to Market 2222 E\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],483,0],0]]]],[[\"\\u003cstep
  maneuver='TURN' meters='78'\\u003eTurn \\u003cturn side='RIGHT'\\u003eright\\u003c/turn\\u003e
  onto \\u003croadlist\\u003e\\u003croad lang='en'\\u003eBalcones Dr\\u003c/road\\u003e\\u003c/roadlist\\u003e\\u003c/step\\u003e\",[78,\"256
  ft\",1],[23,\"23 s\"],0,null,null,null,null,[[null,\"Destination will be on the
  right\",null,null,null,null,null,null,8,null,null,null,null,null,null,2]],[[[2614.437784468421,-97.7571787,30.3374811],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.33757830324543,-97.75735420332924],[null,null,30.3374811,-97.7571787]],[null,null,30.3374811,-97.7571787],null,[[183.8274343005273,-97.75879181485755,30.33837452670841],[122.6894836425781,45,0],[1024,768],60],[\"L779le10Ih46HxAykvObcA\",0,1,null,null,366.0218811035156,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=L779le10Ih46HxAykvObcA\\u0026w=203\\u0026h=100\\u0026yaw=118\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.337573,-97.757345\",\"\",null,[203,100]],null,[[3,-97.75734475461114,30.33757310280168],[118.9887084960938,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CDgQ9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3DL779le10Ih46HxAykvObcA\\u0026sa=U\\u0026ved=0CDkQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNECEto2a1f6y_MIqJB1lGtv-y-Q4A\",null,null,\"0CDkQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"L779le10Ih46HxAykvObcA\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.33757310280168,-97.75734475461114]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=L779le10Ih46HxAykvObcA\"]],2]],null,[[2,[\"Turn
  \"]],[14,[\"right\",1]],[2,[\" onto \"]],[2,[\"Balcones Dr\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],483,0],0]]]]]],[[null,null,[2133,\"35
  min\",2100],3,[[\"1445374680\",\"America/Chicago\",\"3:58 PM\",-18000,\"1445374680\"],[\"1445376813\",\"America/Chicago\",\"4:33
  PM\",-18000,\"1445376780\"],null,null,[\"1445374680\",\"America/Chicago\",\"3:58
  PM\",-18000,\"1445374680\"],[\"1445376813\",\"America/Chicago\",\"4:33 PM\",-18000,\"1445376780\"]],[\"Balcones/Northland\",null,30,\"#009ca7\",[[\"Capital
  Metro\",\"3508131340849202367\",null,null,\"1 512-474-1200\",null,null,[\"/url?q=http://www.capmetro.org/\\u0026sa=U\\u0026ved=0CDsQvUwoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNEz-vxk9RiqqKpmZkHhN0Z-I0xxbw\",null,null,\"0CDsQvUwoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],[\"/url?q=http://www.capmetro.org/fares/\\u0026sa=U\\u0026ved=0CDwQkFwoATAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNFQ1tWq_-9Vs8f5n7JQTGE2f-FYag\",\"Ticket
  information\",null,\"0CDwQkFwoATAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"]]],null,null,null,null,null,null,2,[\"Balcones/Northland\",\"4650\",null,[\"1445374680\",\"America/Chicago\",\"3:58
  PM\",-18000,\"1445374680\"],[null,null,30.33696,-97.75756],null,\"0x8644cae4195eddef:0xfafda08eb4b15d36\",null,null,null,0],[\"Guadalupe/8th\",\"5950\",[\"1445376813\",\"America/Chicago\",\"4:33
  PM\",-18000,\"1445376780\"],null,[null,null,30.271503,-97.74547799999999],null,\"0x8644b50bbf40f953:0x30bb6deac85e0f65\",null,null,null,0],[[\"3313
  Hancock/Balcones\",\"1927\",[\"1445374778\",\"America/Chicago\",\"3:59 PM\",-18000,\"1445374740\"],[\"1445374778\",\"America/Chicago\",\"3:59
  PM\",-18000,\"1445374740\"],[null,null,30.332659,-97.7597],null,\"0x8644cae62375dbcb:0xe455e33bf0489144\",null,null,null,0],[\"Hancock/Valley
  Oak\",\"1928\",[\"1445374824\",\"America/Chicago\",\"4:00 PM\",-18000,\"1445374800\"],[\"1445374824\",\"America/Chicago\",\"4:00
  PM\",-18000,\"1445374800\"],[null,null,30.331464,-97.75715],null,\"0x8644caef451a8449:0x1a5d855dfad2c934\",null,null,null,0],[\"Hancock/West
  Frances Place\",\"1929\",[\"1445374895\",\"America/Chicago\",\"4:01 PM\",-18000,\"1445374860\"],[\"1445374895\",\"America/Chicago\",\"4:01
  PM\",-18000,\"1445374860\"],[null,null,30.329566,-97.753292],null,\"0x8644caee32c33623:0xe2abc1003c25c2c6\",null,null,null,0],[\"2825
  Hancock/Fresco\",\"1930\",[\"1445374951\",\"America/Chicago\",\"4:02 PM\",-18000,\"1445374920\"],[\"1445374951\",\"America/Chicago\",\"4:02
  PM\",-18000,\"1445374920\"],[null,null,30.32806,-97.75023999999999],null,\"0x8644caf19be79a89:0x770034544c58e3c\",null,null,null,0],[\"Bull
  Creek/Hancock\",\"1931\",[\"1445374980\",\"America/Chicago\",\"4:03 PM\",-18000,\"1445374980\"],[\"1445374980\",\"America/Chicago\",\"4:03
  PM\",-18000,\"1445374980\"],[null,null,30.327267,-97.74943499999999],null,\"0x8644caf17c320e8f:0xa378ca802821dd88\",null,null,null,0],[\"4748
  Bull Creek/49th\",\"1932\",[\"1445375043\",\"America/Chicago\",\"4:04 PM\",-18000,\"1445375040\"],[\"1445375043\",\"America/Chicago\",\"4:04
  PM\",-18000,\"1445375040\"],[null,null,30.32479,-97.75094999999999],null,\"0x8644caf25ccf3603:0xabc10a77ca9ac13d\",null,null,null,0],[\"4700
  Bull Creek/Perry\",\"1933\",[\"1445375083\",\"America/Chicago\",\"4:04 PM\",-18000,\"1445375040\"],[\"1445375083\",\"America/Chicago\",\"4:04
  PM\",-18000,\"1445375040\"],[null,null,30.32321,-97.75192],null,\"0x8644caf2909ac6bf:0xcbeb4591f9651474\",null,null,null,0],[\"4318
  Bull Creek/44th\",\"1935\",[\"1445375211\",\"America/Chicago\",\"4:06 PM\",-18000,\"1445375160\"],[\"1445375211\",\"America/Chicago\",\"4:06
  PM\",-18000,\"1445375160\"],[null,null,30.318162,-97.755038],null,\"0x8644ca92ff635179:0x41645008157d5d35\",null,null,null,0],[\"4220
  Bull Creek/Jackson\",\"1936\",[\"1445375245\",\"America/Chicago\",\"4:07 PM\",-18000,\"1445375220\"],[\"1445375245\",\"America/Chicago\",\"4:07
  PM\",-18000,\"1445375220\"],[null,null,30.316658,-97.754834],null,\"0x8644ca9236436f75:0x15d5318efd5973ca\",null,null,null,0],[\"Bull
  Creek/40th\",\"1937\",[\"1445375319\",\"America/Chicago\",\"4:08 PM\",-18000,\"1445375280\"],[\"1445375319\",\"America/Chicago\",\"4:08
  PM\",-18000,\"1445375280\"],[null,null,30.313601,-97.75339099999999],null,\"0x8644ca91c3819693:0xd619c4ead42e0728\",null,null,null,0],[\"Bull
  Creek/38th\",\"1938\",[\"1445375379\",\"America/Chicago\",\"4:09 PM\",-18000,\"1445375340\"],[\"1445375379\",\"America/Chicago\",\"4:09
  PM\",-18000,\"1445375340\"],[null,null,30.31114,-97.75206],null,\"0x8644ca8fe77c8a95:0x3c2476b809f0d5e0\",null,null,null,0],[\"3604
  Bull Creek/Jefferson\",\"1939\",[\"1445375423\",\"America/Chicago\",\"4:10 PM\",-18000,\"1445375400\"],[\"1445375423\",\"America/Chicago\",\"4:10
  PM\",-18000,\"1445375400\"],[null,null,30.3094,-97.75094999999999],null,\"0x8644ca8566cef7f7:0x230d42970a4cff3d\",null,null,null,0],[\"35th/Crawford\",\"1997\",[\"1445375517\",\"America/Chicago\",\"4:11
  PM\",-18000,\"1445375460\"],[\"1445375517\",\"America/Chicago\",\"4:11 PM\",-18000,\"1445375460\"],[null,null,30.30713,-97.74927],null,\"0x8644ca85ad19e8b5:0xb811da8bf1f3dc6\",null,null,null,0],[\"1301
  w 38th/Tonkawa\",\"1998\",[\"1445375583\",\"America/Chicago\",\"4:13 PM\",-18000,\"1445375580\"],[\"1445375583\",\"America/Chicago\",\"4:13
  PM\",-18000,\"1445375580\"],[null,null,30.30646,-97.74609],null,\"0x8644ca8691f85efb:0x45b8b5f9fb2b54d6\",null,null,null,0],[\"38th/Medical
  Parkway\",\"1999\",[\"1445375640\",\"America/Chicago\",\"4:14 PM\",-18000,\"1445375640\"],[\"1445375640\",\"America/Chicago\",\"4:14
  PM\",-18000,\"1445375640\"],[null,null,30.305323,-97.74375999999999],null,\"0x8644ca87253aff93:0xd7107cbd3fcdf6d8\",null,null,null,0],[\"West
  38th Station (SB)\",\"5349\",[\"1445375703\",\"America/Chicago\",\"4:15 PM\",-18000,\"1445375700\"],[\"1445375703\",\"America/Chicago\",\"4:15
  PM\",-18000,\"1445375700\"],[null,null,30.304405,-97.74159399999999],null,\"0x8644ca7e01c99859:0x788311ded96f86e0\",null,null,null,0],[\"38th/Ronson\",\"5352\",[\"1445375767\",\"America/Chicago\",\"4:16
  PM\",-18000,\"1445375760\"],[\"1445375767\",\"America/Chicago\",\"4:16 PM\",-18000,\"1445375760\"],[null,null,30.303401,-97.73946099999999],null,\"0x8644ca7e670a99d3:0x5eedeefc5c9ad388\",null,null,null,0],[\"Guadalupe/Maiden\",\"489\",[\"1445375846\",\"America/Chicago\",\"4:17
  PM\",-18000,\"1445375820\"],[\"1445375846\",\"America/Chicago\",\"4:17 PM\",-18000,\"1445375820\"],[null,null,30.30167,-97.73895999999999],null,\"0x8644ca7faa779365:0x2c976e9ff65f1dac\",null,null,null,0],[\"Guadalupe/34th
  Street\",\"490\",[\"1445375887\",\"America/Chicago\",\"4:18 PM\",-18000,\"1445375880\"],[\"1445375887\",\"America/Chicago\",\"4:18
  PM\",-18000,\"1445375880\"],[null,null,30.30046,-97.73971],null,\"0x8644ca7f96375511:0x631f44252c0a567d\",null,null,null,0],[\"Guadalupe/31ST\",\"5357\",[\"1445375971\",\"America/Chicago\",\"4:19
  PM\",-18000,\"1445375940\"],[\"1445375971\",\"America/Chicago\",\"4:19 PM\",-18000,\"1445375940\"],[null,null,30.29803,-97.74127],null,\"0x8644b580198380bd:0xac3b9b52cc153844\",null,null,null,0],[\"Guadalupe/30th
  Street\",\"492\",[\"1445376013\",\"America/Chicago\",\"4:20 PM\",-18000,\"1445376000\"],[\"1445376013\",\"America/Chicago\",\"4:20
  PM\",-18000,\"1445376000\"],[null,null,30.2968,-97.74203],null,\"0x8644b57f8f35ce37:0x74c5a880904daaa6\",null,null,null,0],[\"2900
  Guadalupe/29th\",\"2003\",[\"1445376053\",\"America/Chicago\",\"4:20 PM\",-18000,\"1445376000\"],[\"1445376053\",\"America/Chicago\",\"4:20
  PM\",-18000,\"1445376000\"],[null,null,30.29565,-97.74275],null,\"0x8644b57f7416aacf:0xf1f4a9b373cb4eb2\",null,null,null,0],[\"Guadalupe/27th
  Street\",\"494\",[\"1445376165\",\"America/Chicago\",\"4:22 PM\",-18000,\"1445376120\"],[\"1445376165\",\"America/Chicago\",\"4:22
  PM\",-18000,\"1445376120\"],[null,null,30.2922,-97.74131],null,\"0x8644b5820ecbdfdb:0x832f40b56db4d373\",null,null,null,0],[\"Guadalupe/26th
  Street\",\"495\",[\"1445376213\",\"America/Chicago\",\"4:23 PM\",-18000,\"1445376180\"],[\"1445376213\",\"America/Chicago\",\"4:23
  PM\",-18000,\"1445376180\"],[null,null,30.29067,-97.74141],null,\"0x8644b582794a25e1:0x39814b455281fad2\",null,null,null,0],[\"2414
  Guadalupe/24th\",\"4094\",[\"1445376289\",\"America/Chicago\",\"4:24 PM\",-18000,\"1445376240\"],[\"1445376289\",\"America/Chicago\",\"4:24
  PM\",-18000,\"1445376240\"],[null,null,30.288183,-97.74165499999999],null,\"0x8644b582a7f7182b:0x4c656abdd5e7fe2d\",null,null,null,0],[\"UT
  West Mall Station (SB)\",\"497\",[\"1445376353\",\"America/Chicago\",\"4:25 PM\",-18000,\"1445376300\"],[\"1445376353\",\"America/Chicago\",\"4:25
  PM\",-18000,\"1445376300\"],[null,null,30.286064,-97.741815],null,\"0x8644b577e05dee8f:0x43bdc6e5cc85ed03\",null,null,null,0],[\"Guadalupe/W.
  21ST Street\",\"498\",[\"1445376435\",\"America/Chicago\",\"4:27 PM\",-18000,\"1445376420\"],[\"1445376435\",\"America/Chicago\",\"4:27
  PM\",-18000,\"1445376420\"],[null,null,30.283384,-97.742081],null,\"0x8644b57623ec6f3f:0x914c4703298c5606\",null,null,null,0],[\"Guadalupe/16th
  Street\",\"501\",[\"1445376574\",\"America/Chicago\",\"4:29 PM\",-18000,\"1445376540\"],[\"1445376574\",\"America/Chicago\",\"4:29
  PM\",-18000,\"1445376540\"],[null,null,30.27896,-97.74271],null,\"0x8644b5759e838fab:0xc19ba37bc5792f3\",null,null,null,0],[\"Capitol
  Station (SB)\",\"2738\",[\"1445376700\",\"America/Chicago\",\"4:31 PM\",-18000,\"1445376660\"],[\"1445376700\",\"America/Chicago\",\"4:31
  PM\",-18000,\"1445376660\"],[null,null,30.275022,-97.744169],null,\"0x8644b50ad9c59551:0xd1ce7997124d6ab\",null,null,null,0]],[[[null,null,\"a\",[1.25,\"$1.25\",\"USD\"]]],1,0]],null,null,null,[[[2614.437784473066,-97.75756000000001,30.33696],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.33700682790965,-97.75764903643169],[null,null,30.33696,-97.75756]],[null,null,30.33696,-97.75756],null,[[183.8274343008539,-97.75919673408904,30.33782082197975],[121.3574676513672,45,0],[1024,768],60]],[1.25,\"$1.25\",\"USD\"],[[4,null,[3,\"bus.png\",null,\"Bus\",[[\"https://maps.gstatic.com/mapfiles/transit/iw2/b/bus.png\",0,[15,15],null,0]]]],[5,[\"19\",1,\"#009ca7\",\"#000000\"]],[7,[\"towards
  19-Bull Creek-SB\"]]]],null,[[\"Balcones/Northland\",\"4650\",null,[\"1445374680\",\"America/Chicago\",\"3:58
  PM\",-18000,\"1445374680\"],[null,null,30.33696,-97.75756],null,\"0x8644cae4195eddef:0xfafda08eb4b15d36\",null,null,null,0],[\"Guadalupe/8th\",\"5950\",[\"1445376813\",\"America/Chicago\",\"4:33
  PM\",-18000,\"1445376780\"],null,[null,null,30.271503,-97.74547799999999],null,\"0x8644b50bbf40f953:0x30bb6deac85e0f65\",null,null,null,0],30,\"#009ca7\",0,null,2,[[\"3313
  Hancock/Balcones\",\"1927\",[\"1445374778\",\"America/Chicago\",\"3:59 PM\",-18000,\"1445374740\"],[\"1445374778\",\"America/Chicago\",\"3:59
  PM\",-18000,\"1445374740\"],[null,null,30.332659,-97.7597],null,\"0x8644cae62375dbcb:0xe455e33bf0489144\",null,null,null,0],[\"Hancock/Valley
  Oak\",\"1928\",[\"1445374824\",\"America/Chicago\",\"4:00 PM\",-18000,\"1445374800\"],[\"1445374824\",\"America/Chicago\",\"4:00
  PM\",-18000,\"1445374800\"],[null,null,30.331464,-97.75715],null,\"0x8644caef451a8449:0x1a5d855dfad2c934\",null,null,null,0],[\"Hancock/West
  Frances Place\",\"1929\",[\"1445374895\",\"America/Chicago\",\"4:01 PM\",-18000,\"1445374860\"],[\"1445374895\",\"America/Chicago\",\"4:01
  PM\",-18000,\"1445374860\"],[null,null,30.329566,-97.753292],null,\"0x8644caee32c33623:0xe2abc1003c25c2c6\",null,null,null,0],[\"2825
  Hancock/Fresco\",\"1930\",[\"1445374951\",\"America/Chicago\",\"4:02 PM\",-18000,\"1445374920\"],[\"1445374951\",\"America/Chicago\",\"4:02
  PM\",-18000,\"1445374920\"],[null,null,30.32806,-97.75023999999999],null,\"0x8644caf19be79a89:0x770034544c58e3c\",null,null,null,0],[\"Bull
  Creek/Hancock\",\"1931\",[\"1445374980\",\"America/Chicago\",\"4:03 PM\",-18000,\"1445374980\"],[\"1445374980\",\"America/Chicago\",\"4:03
  PM\",-18000,\"1445374980\"],[null,null,30.327267,-97.74943499999999],null,\"0x8644caf17c320e8f:0xa378ca802821dd88\",null,null,null,0],[\"4748
  Bull Creek/49th\",\"1932\",[\"1445375043\",\"America/Chicago\",\"4:04 PM\",-18000,\"1445375040\"],[\"1445375043\",\"America/Chicago\",\"4:04
  PM\",-18000,\"1445375040\"],[null,null,30.32479,-97.75094999999999],null,\"0x8644caf25ccf3603:0xabc10a77ca9ac13d\",null,null,null,0],[\"4700
  Bull Creek/Perry\",\"1933\",[\"1445375083\",\"America/Chicago\",\"4:04 PM\",-18000,\"1445375040\"],[\"1445375083\",\"America/Chicago\",\"4:04
  PM\",-18000,\"1445375040\"],[null,null,30.32321,-97.75192],null,\"0x8644caf2909ac6bf:0xcbeb4591f9651474\",null,null,null,0],[\"4318
  Bull Creek/44th\",\"1935\",[\"1445375211\",\"America/Chicago\",\"4:06 PM\",-18000,\"1445375160\"],[\"1445375211\",\"America/Chicago\",\"4:06
  PM\",-18000,\"1445375160\"],[null,null,30.318162,-97.755038],null,\"0x8644ca92ff635179:0x41645008157d5d35\",null,null,null,0],[\"4220
  Bull Creek/Jackson\",\"1936\",[\"1445375245\",\"America/Chicago\",\"4:07 PM\",-18000,\"1445375220\"],[\"1445375245\",\"America/Chicago\",\"4:07
  PM\",-18000,\"1445375220\"],[null,null,30.316658,-97.754834],null,\"0x8644ca9236436f75:0x15d5318efd5973ca\",null,null,null,0],[\"Bull
  Creek/40th\",\"1937\",[\"1445375319\",\"America/Chicago\",\"4:08 PM\",-18000,\"1445375280\"],[\"1445375319\",\"America/Chicago\",\"4:08
  PM\",-18000,\"1445375280\"],[null,null,30.313601,-97.75339099999999],null,\"0x8644ca91c3819693:0xd619c4ead42e0728\",null,null,null,0],[\"Bull
  Creek/38th\",\"1938\",[\"1445375379\",\"America/Chicago\",\"4:09 PM\",-18000,\"1445375340\"],[\"1445375379\",\"America/Chicago\",\"4:09
  PM\",-18000,\"1445375340\"],[null,null,30.31114,-97.75206],null,\"0x8644ca8fe77c8a95:0x3c2476b809f0d5e0\",null,null,null,0],[\"3604
  Bull Creek/Jefferson\",\"1939\",[\"1445375423\",\"America/Chicago\",\"4:10 PM\",-18000,\"1445375400\"],[\"1445375423\",\"America/Chicago\",\"4:10
  PM\",-18000,\"1445375400\"],[null,null,30.3094,-97.75094999999999],null,\"0x8644ca8566cef7f7:0x230d42970a4cff3d\",null,null,null,0],[\"35th/Crawford\",\"1997\",[\"1445375517\",\"America/Chicago\",\"4:11
  PM\",-18000,\"1445375460\"],[\"1445375517\",\"America/Chicago\",\"4:11 PM\",-18000,\"1445375460\"],[null,null,30.30713,-97.74927],null,\"0x8644ca85ad19e8b5:0xb811da8bf1f3dc6\",null,null,null,0],[\"1301
  w 38th/Tonkawa\",\"1998\",[\"1445375583\",\"America/Chicago\",\"4:13 PM\",-18000,\"1445375580\"],[\"1445375583\",\"America/Chicago\",\"4:13
  PM\",-18000,\"1445375580\"],[null,null,30.30646,-97.74609],null,\"0x8644ca8691f85efb:0x45b8b5f9fb2b54d6\",null,null,null,0],[\"38th/Medical
  Parkway\",\"1999\",[\"1445375640\",\"America/Chicago\",\"4:14 PM\",-18000,\"1445375640\"],[\"1445375640\",\"America/Chicago\",\"4:14
  PM\",-18000,\"1445375640\"],[null,null,30.305323,-97.74375999999999],null,\"0x8644ca87253aff93:0xd7107cbd3fcdf6d8\",null,null,null,0],[\"West
  38th Station (SB)\",\"5349\",[\"1445375703\",\"America/Chicago\",\"4:15 PM\",-18000,\"1445375700\"],[\"1445375703\",\"America/Chicago\",\"4:15
  PM\",-18000,\"1445375700\"],[null,null,30.304405,-97.74159399999999],null,\"0x8644ca7e01c99859:0x788311ded96f86e0\",null,null,null,0],[\"38th/Ronson\",\"5352\",[\"1445375767\",\"America/Chicago\",\"4:16
  PM\",-18000,\"1445375760\"],[\"1445375767\",\"America/Chicago\",\"4:16 PM\",-18000,\"1445375760\"],[null,null,30.303401,-97.73946099999999],null,\"0x8644ca7e670a99d3:0x5eedeefc5c9ad388\",null,null,null,0],[\"Guadalupe/Maiden\",\"489\",[\"1445375846\",\"America/Chicago\",\"4:17
  PM\",-18000,\"1445375820\"],[\"1445375846\",\"America/Chicago\",\"4:17 PM\",-18000,\"1445375820\"],[null,null,30.30167,-97.73895999999999],null,\"0x8644ca7faa779365:0x2c976e9ff65f1dac\",null,null,null,0],[\"Guadalupe/34th
  Street\",\"490\",[\"1445375887\",\"America/Chicago\",\"4:18 PM\",-18000,\"1445375880\"],[\"1445375887\",\"America/Chicago\",\"4:18
  PM\",-18000,\"1445375880\"],[null,null,30.30046,-97.73971],null,\"0x8644ca7f96375511:0x631f44252c0a567d\",null,null,null,0],[\"Guadalupe/31ST\",\"5357\",[\"1445375971\",\"America/Chicago\",\"4:19
  PM\",-18000,\"1445375940\"],[\"1445375971\",\"America/Chicago\",\"4:19 PM\",-18000,\"1445375940\"],[null,null,30.29803,-97.74127],null,\"0x8644b580198380bd:0xac3b9b52cc153844\",null,null,null,0],[\"Guadalupe/30th
  Street\",\"492\",[\"1445376013\",\"America/Chicago\",\"4:20 PM\",-18000,\"1445376000\"],[\"1445376013\",\"America/Chicago\",\"4:20
  PM\",-18000,\"1445376000\"],[null,null,30.2968,-97.74203],null,\"0x8644b57f8f35ce37:0x74c5a880904daaa6\",null,null,null,0],[\"2900
  Guadalupe/29th\",\"2003\",[\"1445376053\",\"America/Chicago\",\"4:20 PM\",-18000,\"1445376000\"],[\"1445376053\",\"America/Chicago\",\"4:20
  PM\",-18000,\"1445376000\"],[null,null,30.29565,-97.74275],null,\"0x8644b57f7416aacf:0xf1f4a9b373cb4eb2\",null,null,null,0],[\"Guadalupe/27th
  Street\",\"494\",[\"1445376165\",\"America/Chicago\",\"4:22 PM\",-18000,\"1445376120\"],[\"1445376165\",\"America/Chicago\",\"4:22
  PM\",-18000,\"1445376120\"],[null,null,30.2922,-97.74131],null,\"0x8644b5820ecbdfdb:0x832f40b56db4d373\",null,null,null,0],[\"Guadalupe/26th
  Street\",\"495\",[\"1445376213\",\"America/Chicago\",\"4:23 PM\",-18000,\"1445376180\"],[\"1445376213\",\"America/Chicago\",\"4:23
  PM\",-18000,\"1445376180\"],[null,null,30.29067,-97.74141],null,\"0x8644b582794a25e1:0x39814b455281fad2\",null,null,null,0],[\"2414
  Guadalupe/24th\",\"4094\",[\"1445376289\",\"America/Chicago\",\"4:24 PM\",-18000,\"1445376240\"],[\"1445376289\",\"America/Chicago\",\"4:24
  PM\",-18000,\"1445376240\"],[null,null,30.288183,-97.74165499999999],null,\"0x8644b582a7f7182b:0x4c656abdd5e7fe2d\",null,null,null,0],[\"UT
  West Mall Station (SB)\",\"497\",[\"1445376353\",\"America/Chicago\",\"4:25 PM\",-18000,\"1445376300\"],[\"1445376353\",\"America/Chicago\",\"4:25
  PM\",-18000,\"1445376300\"],[null,null,30.286064,-97.741815],null,\"0x8644b577e05dee8f:0x43bdc6e5cc85ed03\",null,null,null,0],[\"Guadalupe/W.
  21ST Street\",\"498\",[\"1445376435\",\"America/Chicago\",\"4:27 PM\",-18000,\"1445376420\"],[\"1445376435\",\"America/Chicago\",\"4:27
  PM\",-18000,\"1445376420\"],[null,null,30.283384,-97.742081],null,\"0x8644b57623ec6f3f:0x914c4703298c5606\",null,null,null,0],[\"Guadalupe/16th
  Street\",\"501\",[\"1445376574\",\"America/Chicago\",\"4:29 PM\",-18000,\"1445376540\"],[\"1445376574\",\"America/Chicago\",\"4:29
  PM\",-18000,\"1445376540\"],[null,null,30.27896,-97.74271],null,\"0x8644b5759e838fab:0xc19ba37bc5792f3\",null,null,null,0],[\"Capitol
  Station (SB)\",\"2738\",[\"1445376700\",\"America/Chicago\",\"4:31 PM\",-18000,\"1445376660\"],[\"1445376700\",\"America/Chicago\",\"4:31
  PM\",-18000,\"1445376660\"],[null,null,30.275022,-97.744169],null,\"0x8644b50ad9c59551:0xd1ce7997124d6ab\",null,null,null,0]],[[[null,null,\"a\",[1.25,\"$1.25\",\"USD\"]]],1,0],null,0,0,[[[[[4,null,[3,\"bus.png\",null,\"Bus\",[[\"https://maps.gstatic.com/mapfiles/transit/iw2/b/bus.png\",0,[15,15],null,0]]]],[5,[\"19\",1,\"#009ca7\",\"#000000\"]],[7,[\"towards
  19-Bull Creek-SB\"]]],[[\"Capital Metro\",\"3508131340849202367\",null,null,\"1
  512-474-1200\",null,null,[\"/url?q=http://www.capmetro.org/\\u0026sa=U\\u0026ved=0CD0QvUwoAjAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNEz-vxk9RiqqKpmZkHhN0Z-I0xxbw\",null,null,\"0CD0QvUwoAjAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],[\"/url?q=http://www.capmetro.org/fares/\\u0026sa=U\\u0026ved=0CD4QkFwoAzAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNFQ1tWq_-9Vs8f5n7JQTGE2f-FYag\",\"Ticket
  information\",null,\"0CD4QkFwoAzAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"]]],\"#009ca7\",\"19-Bull
  Creek-SB\"],[2133,\"35 min\",2100],0,30,[2133,\"35 min\",2100]]],null,\"BChIJ6WFX24zKRIYRMkNQQNoUSoQQhMmasQU=\",null,[0],[2133,\"35
  min\",2100],\"ChIJ791eGeTKRIYRNl2xtI6g_foSEglT-UC_C7VEhhFlD17I6m27MBjY1ZqxBSACMgx1cy10eC1hdXN0aW441RA=\"]],[[null,null,[1964,\"33
  min\",1980],3,[[\"1445377424\",\"America/Chicago\",\"4:43 PM\",-18000,\"1445377380\"],[\"1445379388\",\"America/Chicago\",\"5:16
  PM\",-18000,\"1445379360\"],null,null,[\"1445377424\",\"America/Chicago\",\"4:43
  PM\",-18000,\"1445377380\"],[\"1445379388\",\"America/Chicago\",\"5:16 PM\",-18000,\"1445379360\"]],[\"Guadalupe/8th\",\"4600
  Freidrich/St Elmo\",26,\"#e11f8f\",[[\"Capital Metro\",\"3508131340849202367\",null,null,\"1
  512-474-1200\",null,null,[\"/url?q=http://www.capmetro.org/\\u0026sa=U\\u0026ved=0CEAQvUwoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNEz-vxk9RiqqKpmZkHhN0Z-I0xxbw\",null,null,\"0CEAQvUwoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],[\"/url?q=http://www.capmetro.org/fares/\\u0026sa=U\\u0026ved=0CEEQkFwoATAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNFQ1tWq_-9Vs8f5n7JQTGE2f-FYag\",\"Ticket
  information\",null,\"0CEEQkFwoATAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"]]],null,null,null,null,null,null,2,[\"Guadalupe/8th\",\"5950\",null,[\"1445377424\",\"America/Chicago\",\"4:43
  PM\",-18000,\"1445377380\"],[null,null,30.271503,-97.74547799999999],null,\"0x8644b50bbf40f953:0x30bb6deac85e0f65\",null,null,null,0],[\"4600
  Freidrich/St Elmo\",\"1203\",[\"1445379388\",\"America/Chicago\",\"5:16 PM\",-18000,\"1445379360\"],null,[null,null,30.20818,-97.75090999999999],null,\"0x8644b482eb738e89:0xf8056593f87dc187\",null,null,null,0],[[\"Guadalupe/4th\",\"2613\",[\"1445377583\",\"America/Chicago\",\"4:46
  PM\",-18000,\"1445377560\"],[\"1445377583\",\"America/Chicago\",\"4:46 PM\",-18000,\"1445377560\"],[null,null,30.26733,-97.74704],null,\"0x8644b5092b43859b:0xe33cd1c6a63c2ad\",null,null,null,0],[\"Auditorium
  Shores Station (SB)\",\"2763\",[\"1445377913\",\"America/Chicago\",\"4:51 PM\",-18000,\"1445377860\"],[\"1445377913\",\"America/Chicago\",\"4:51
  PM\",-18000,\"1445377860\"],[null,null,30.258767,-97.7487],null,\"0x8644b50473943fbd:0x15281c44b9c8d148\",null,null,null,0],[\"Riverside/Congress
  FS\",\"3846\",[\"1445378040\",\"America/Chicago\",\"4:54 PM\",-18000,\"1445378040\"],[\"1445378040\",\"America/Chicago\",\"4:54
  PM\",-18000,\"1445378040\"],[null,null,30.2562,-97.74602],null,\"0x8644b50172312a59:0xb3277b1f1bd67dcf\",null,null,null,0],[\"205
  Riverside/Congress\",\"3847\",[\"1445378070\",\"America/Chicago\",\"4:54 PM\",-18000,\"1445378040\"],[\"1445378070\",\"America/Chicago\",\"4:54
  PM\",-18000,\"1445378040\"],[null,null,30.254846,-97.744793],null,\"0x8644b501b199e399:0x217c3a29018eeb0\",null,null,null,0],[\"325
  Riverside/Newning\",\"5023\",[\"1445378095\",\"America/Chicago\",\"4:54 PM\",-18000,\"1445378040\"],[\"1445378095\",\"America/Chicago\",\"4:54
  PM\",-18000,\"1445378040\"],[null,null,30.25359,-97.743972],null,\"0x8644b50031e21013:0xb7367e2f3fadcffb\",null,null,null,0],[\"715
  Riverside/Alameda\",\"1186\",[\"1445378168\",\"America/Chicago\",\"4:56 PM\",-18000,\"1445378160\"],[\"1445378168\",\"America/Chicago\",\"4:56
  PM\",-18000,\"1445378160\"],[null,null,30.25073,-97.74060999999999],null,\"0x8644b45573d27435:0x77213f76cb9fdc5f\",null,null,null,0],[\"1005
  East Riverside/Travis Heights\",\"1187\",[\"1445378208\",\"America/Chicago\",\"4:56
  PM\",-18000,\"1445378160\"],[\"1445378208\",\"America/Chicago\",\"4:56 PM\",-18000,\"1445378160\"],[null,null,30.24959,-97.73835],null,\"0x8644b4544fe6361d:0x71572d34c74f16fd\",null,null,null,0],[\"Riverside/Kenwood\",\"1188\",[\"1445378237\",\"America/Chicago\",\"4:57
  PM\",-18000,\"1445378220\"],[\"1445378237\",\"America/Chicago\",\"4:57 PM\",-18000,\"1445378220\"],[null,null,30.248592,-97.736886],null,\"0x8644b4540e1b273d:0x5735e5c1f1cf1511\",null,null,null,0],[\"Riverside/Summit\",\"999\",[\"1445378332\",\"America/Chicago\",\"4:58
  PM\",-18000,\"1445378280\"],[\"1445378332\",\"America/Chicago\",\"4:58 PM\",-18000,\"1445378280\"],[null,null,30.245976,-97.731836],null,\"0x8644b451c4354b05:0x67b55787a4820e74\",null,null,null,0],[\"1805
  Riverside/Parker\",\"5554\",[\"1445378407\",\"America/Chicago\",\"5:00 PM\",-18000,\"1445378400\"],[\"1445378407\",\"America/Chicago\",\"5:00
  PM\",-18000,\"1445378400\"],[null,null,30.242658,-97.729061],null,\"0x8644b44f8eb2c1e1:0x5289e05197242222\",null,null,null,0],[\"Riverside/Burton\",\"1002\",[\"1445378460\",\"America/Chicago\",\"5:01
  PM\",-18000,\"1445378460\"],[\"1445378460\",\"America/Chicago\",\"5:01 PM\",-18000,\"1445378460\"],[null,null,30.240343,-97.72730899999999],null,\"0x8644b445ba86499d:0x94fda4df4d8a5c17\",null,null,null,0],[\"1724
  Burton/Woodland\",\"1190\",[\"1445378563\",\"America/Chicago\",\"5:02 PM\",-18000,\"1445378520\"],[\"1445378563\",\"America/Chicago\",\"5:02
  PM\",-18000,\"1445378520\"],[null,null,30.23615,-97.72846],null,\"0x8644b4437be76c15:0x8dd6fbec5461e336\",null,null,null,0],[\"1920
  Burton/Mariposa\",\"1191\",[\"1445378645\",\"America/Chicago\",\"5:04 PM\",-18000,\"1445378640\"],[\"1445378645\",\"America/Chicago\",\"5:04
  PM\",-18000,\"1445378640\"],[null,null,30.23386,-97.73181],null,\"0x8644b45cd95397f5:0x68ea05a7424a8d6e\",null,null,null,0],[\"2200
  Burton/Oltorf\",\"3535\",[\"1445378712\",\"America/Chicago\",\"5:05 PM\",-18000,\"1445378700\"],[\"1445378712\",\"America/Chicago\",\"5:05
  PM\",-18000,\"1445378700\"],[null,null,30.231271,-97.733733],null,\"0x8644b45d82a38c4d:0xd851f1f71d95436f\",null,null,null,0],[\"2310
  Parker/Oltorf\",\"1193\",[\"1445378801\",\"America/Chicago\",\"5:06 PM\",-18000,\"1445378760\"],[\"1445378801\",\"America/Chicago\",\"5:06
  PM\",-18000,\"1445378760\"],[null,null,30.23187,-97.73729],null,\"0x8644b45e6b671df3:0x237b166cc3380a1c\",null,null,null,0],[\"2504
  Parker/Braxton\",\"1194\",[\"1445378849\",\"America/Chicago\",\"5:07 PM\",-18000,\"1445378820\"],[\"1445378849\",\"America/Chicago\",\"5:07
  PM\",-18000,\"1445378820\"],[null,null,30.229929,-97.738557],null,\"0x8644b46083f1351b:0x4d4d847f1e171d34\",null,null,null,0],[\"2718
  Parker/Royal Hill\",\"1195\",[\"1445378913\",\"America/Chicago\",\"5:08 PM\",-18000,\"1445378880\"],[\"1445378913\",\"America/Chicago\",\"5:08
  PM\",-18000,\"1445378880\"],[null,null,30.227504,-97.740505],null,\"0x8644b4603451fa4d:0xc01a031d0d824477\",null,null,null,0],[\"3004
  Parker/Timber Ridge\",\"4325\",[\"1445378977\",\"America/Chicago\",\"5:09 PM\",-18000,\"1445378940\"],[\"1445378977\",\"America/Chicago\",\"5:09
  PM\",-18000,\"1445378940\"],[null,null,30.224895,-97.742138],null,\"0x8644b48a05afde23:0x3393e3cd7c055351\",null,null,null,0],[\"3300
  Parker/Timber Ridge\",\"4323\",[\"1445379037\",\"America/Chicago\",\"5:10 PM\",-18000,\"1445379000\"],[\"1445379037\",\"America/Chicago\",\"5:10
  PM\",-18000,\"1445379000\"],[null,null,30.22216,-97.742228],null,\"0x8644b489d077dce1:0x86b6a15f5b185761\",null,null,null,0],[\"Woodward/Parker
  SW Corner\",\"2169\",[\"1445379120\",\"America/Chicago\",\"5:12 PM\",-18000,\"1445379120\"],[\"1445379120\",\"America/Chicago\",\"5:12
  PM\",-18000,\"1445379120\"],[null,null,30.219261,-97.74391199999999],null,\"0x8644b48864db6491:0x25a5f73b38ad9d82\",null,null,null,0],[\"Woodward/Ben
  White NW Corner\",\"1199\",[\"1445379160\",\"America/Chicago\",\"5:12 PM\",-18000,\"1445379120\"],[\"1445379160\",\"America/Chicago\",\"5:12
  PM\",-18000,\"1445379120\"],[null,null,30.21715,-97.74404],null,\"0x8644b487c98a1859:0xf77faabf8a46110a\",null,null,null,0],[\"Woodward/Ben
  White SW Corner\",\"4318\",[\"1445379209\",\"America/Chicago\",\"5:13 PM\",-18000,\"1445379180\"],[\"1445379209\",\"America/Chicago\",\"5:13
  PM\",-18000,\"1445379180\"],[null,null,30.21464,-97.74469999999999],null,\"0x8644b486e3846989:0xb0761984cdb7061f\",null,null,null,0],[\"4120
  Freidrich/Woodward\",\"4317\",[\"1445379245\",\"America/Chicago\",\"5:14 PM\",-18000,\"1445379240\"],[\"1445379245\",\"America/Chicago\",\"5:14
  PM\",-18000,\"1445379240\"],[null,null,30.213561,-97.74585499999999],null,\"0x8644b486b8f199db:0x220464b14173d0aa\",null,null,null,0],[\"Freidrich/Directors\",\"1202\",[\"1445379298\",\"America/Chicago\",\"5:14
  PM\",-18000,\"1445379240\"],[\"1445379298\",\"America/Chicago\",\"5:14 PM\",-18000,\"1445379240\"],[null,null,30.21249,-97.74821],null,\"0x8644b4840a7545a3:0xd1524cfb80d62b29\",null,null,null,0],[\"4216
  Freidrich/St Elmo\",\"5917\",[\"1445379323\",\"America/Chicago\",\"5:15 PM\",-18000,\"1445379300\"],[\"1445379323\",\"America/Chicago\",\"5:15
  PM\",-18000,\"1445379300\"],[null,null,30.211274,-97.748981],null,\"0x8644b48394723013:0x99d7031b410e5e51\",null,null,null,0]],[[[null,null,\"a\",[1.25,\"$1.25\",\"USD\"]]],1,0]],null,null,null,[[[2614.437784475882,-97.74547799999999,30.271503],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.27152653928243,-97.7455785682351],[null,null,30.271503,-97.74547799999999]],[null,null,30.271503,-97.74547799999999],null,[[183.8274343010519,-97.74732672026376,30.27193571573441],[105.1638717651367,45,0],[1024,768],60]],[1.25,\"$1.25\",\"USD\"],[[4,null,[3,\"bus.png\",null,\"Bus\",[[\"https://maps.gstatic.com/mapfiles/transit/iw2/b/bus.png\",0,[15,15],null,0]]]],[5,[\"7\",1,\"#e11f8f\",\"#000000\"]],[7,[\"towards
  7-Duval / Dove Springs-SB\"]]]],null,[[\"Guadalupe/8th\",\"5950\",null,[\"1445377424\",\"America/Chicago\",\"4:43
  PM\",-18000,\"1445377380\"],[null,null,30.271503,-97.74547799999999],null,\"0x8644b50bbf40f953:0x30bb6deac85e0f65\",null,null,null,0],[\"4600
  Freidrich/St Elmo\",\"1203\",[\"1445379388\",\"America/Chicago\",\"5:16 PM\",-18000,\"1445379360\"],null,[null,null,30.20818,-97.75090999999999],null,\"0x8644b482eb738e89:0xf8056593f87dc187\",null,null,null,0],26,\"#e11f8f\",0,null,2,[[\"Guadalupe/4th\",\"2613\",[\"1445377583\",\"America/Chicago\",\"4:46
  PM\",-18000,\"1445377560\"],[\"1445377583\",\"America/Chicago\",\"4:46 PM\",-18000,\"1445377560\"],[null,null,30.26733,-97.74704],null,\"0x8644b5092b43859b:0xe33cd1c6a63c2ad\",null,null,null,0],[\"Auditorium
  Shores Station (SB)\",\"2763\",[\"1445377913\",\"America/Chicago\",\"4:51 PM\",-18000,\"1445377860\"],[\"1445377913\",\"America/Chicago\",\"4:51
  PM\",-18000,\"1445377860\"],[null,null,30.258767,-97.7487],null,\"0x8644b50473943fbd:0x15281c44b9c8d148\",null,null,null,0],[\"Riverside/Congress
  FS\",\"3846\",[\"1445378040\",\"America/Chicago\",\"4:54 PM\",-18000,\"1445378040\"],[\"1445378040\",\"America/Chicago\",\"4:54
  PM\",-18000,\"1445378040\"],[null,null,30.2562,-97.74602],null,\"0x8644b50172312a59:0xb3277b1f1bd67dcf\",null,null,null,0],[\"205
  Riverside/Congress\",\"3847\",[\"1445378070\",\"America/Chicago\",\"4:54 PM\",-18000,\"1445378040\"],[\"1445378070\",\"America/Chicago\",\"4:54
  PM\",-18000,\"1445378040\"],[null,null,30.254846,-97.744793],null,\"0x8644b501b199e399:0x217c3a29018eeb0\",null,null,null,0],[\"325
  Riverside/Newning\",\"5023\",[\"1445378095\",\"America/Chicago\",\"4:54 PM\",-18000,\"1445378040\"],[\"1445378095\",\"America/Chicago\",\"4:54
  PM\",-18000,\"1445378040\"],[null,null,30.25359,-97.743972],null,\"0x8644b50031e21013:0xb7367e2f3fadcffb\",null,null,null,0],[\"715
  Riverside/Alameda\",\"1186\",[\"1445378168\",\"America/Chicago\",\"4:56 PM\",-18000,\"1445378160\"],[\"1445378168\",\"America/Chicago\",\"4:56
  PM\",-18000,\"1445378160\"],[null,null,30.25073,-97.74060999999999],null,\"0x8644b45573d27435:0x77213f76cb9fdc5f\",null,null,null,0],[\"1005
  East Riverside/Travis Heights\",\"1187\",[\"1445378208\",\"America/Chicago\",\"4:56
  PM\",-18000,\"1445378160\"],[\"1445378208\",\"America/Chicago\",\"4:56 PM\",-18000,\"1445378160\"],[null,null,30.24959,-97.73835],null,\"0x8644b4544fe6361d:0x71572d34c74f16fd\",null,null,null,0],[\"Riverside/Kenwood\",\"1188\",[\"1445378237\",\"America/Chicago\",\"4:57
  PM\",-18000,\"1445378220\"],[\"1445378237\",\"America/Chicago\",\"4:57 PM\",-18000,\"1445378220\"],[null,null,30.248592,-97.736886],null,\"0x8644b4540e1b273d:0x5735e5c1f1cf1511\",null,null,null,0],[\"Riverside/Summit\",\"999\",[\"1445378332\",\"America/Chicago\",\"4:58
  PM\",-18000,\"1445378280\"],[\"1445378332\",\"America/Chicago\",\"4:58 PM\",-18000,\"1445378280\"],[null,null,30.245976,-97.731836],null,\"0x8644b451c4354b05:0x67b55787a4820e74\",null,null,null,0],[\"1805
  Riverside/Parker\",\"5554\",[\"1445378407\",\"America/Chicago\",\"5:00 PM\",-18000,\"1445378400\"],[\"1445378407\",\"America/Chicago\",\"5:00
  PM\",-18000,\"1445378400\"],[null,null,30.242658,-97.729061],null,\"0x8644b44f8eb2c1e1:0x5289e05197242222\",null,null,null,0],[\"Riverside/Burton\",\"1002\",[\"1445378460\",\"America/Chicago\",\"5:01
  PM\",-18000,\"1445378460\"],[\"1445378460\",\"America/Chicago\",\"5:01 PM\",-18000,\"1445378460\"],[null,null,30.240343,-97.72730899999999],null,\"0x8644b445ba86499d:0x94fda4df4d8a5c17\",null,null,null,0],[\"1724
  Burton/Woodland\",\"1190\",[\"1445378563\",\"America/Chicago\",\"5:02 PM\",-18000,\"1445378520\"],[\"1445378563\",\"America/Chicago\",\"5:02
  PM\",-18000,\"1445378520\"],[null,null,30.23615,-97.72846],null,\"0x8644b4437be76c15:0x8dd6fbec5461e336\",null,null,null,0],[\"1920
  Burton/Mariposa\",\"1191\",[\"1445378645\",\"America/Chicago\",\"5:04 PM\",-18000,\"1445378640\"],[\"1445378645\",\"America/Chicago\",\"5:04
  PM\",-18000,\"1445378640\"],[null,null,30.23386,-97.73181],null,\"0x8644b45cd95397f5:0x68ea05a7424a8d6e\",null,null,null,0],[\"2200
  Burton/Oltorf\",\"3535\",[\"1445378712\",\"America/Chicago\",\"5:05 PM\",-18000,\"1445378700\"],[\"1445378712\",\"America/Chicago\",\"5:05
  PM\",-18000,\"1445378700\"],[null,null,30.231271,-97.733733],null,\"0x8644b45d82a38c4d:0xd851f1f71d95436f\",null,null,null,0],[\"2310
  Parker/Oltorf\",\"1193\",[\"1445378801\",\"America/Chicago\",\"5:06 PM\",-18000,\"1445378760\"],[\"1445378801\",\"America/Chicago\",\"5:06
  PM\",-18000,\"1445378760\"],[null,null,30.23187,-97.73729],null,\"0x8644b45e6b671df3:0x237b166cc3380a1c\",null,null,null,0],[\"2504
  Parker/Braxton\",\"1194\",[\"1445378849\",\"America/Chicago\",\"5:07 PM\",-18000,\"1445378820\"],[\"1445378849\",\"America/Chicago\",\"5:07
  PM\",-18000,\"1445378820\"],[null,null,30.229929,-97.738557],null,\"0x8644b46083f1351b:0x4d4d847f1e171d34\",null,null,null,0],[\"2718
  Parker/Royal Hill\",\"1195\",[\"1445378913\",\"America/Chicago\",\"5:08 PM\",-18000,\"1445378880\"],[\"1445378913\",\"America/Chicago\",\"5:08
  PM\",-18000,\"1445378880\"],[null,null,30.227504,-97.740505],null,\"0x8644b4603451fa4d:0xc01a031d0d824477\",null,null,null,0],[\"3004
  Parker/Timber Ridge\",\"4325\",[\"1445378977\",\"America/Chicago\",\"5:09 PM\",-18000,\"1445378940\"],[\"1445378977\",\"America/Chicago\",\"5:09
  PM\",-18000,\"1445378940\"],[null,null,30.224895,-97.742138],null,\"0x8644b48a05afde23:0x3393e3cd7c055351\",null,null,null,0],[\"3300
  Parker/Timber Ridge\",\"4323\",[\"1445379037\",\"America/Chicago\",\"5:10 PM\",-18000,\"1445379000\"],[\"1445379037\",\"America/Chicago\",\"5:10
  PM\",-18000,\"1445379000\"],[null,null,30.22216,-97.742228],null,\"0x8644b489d077dce1:0x86b6a15f5b185761\",null,null,null,0],[\"Woodward/Parker
  SW Corner\",\"2169\",[\"1445379120\",\"America/Chicago\",\"5:12 PM\",-18000,\"1445379120\"],[\"1445379120\",\"America/Chicago\",\"5:12
  PM\",-18000,\"1445379120\"],[null,null,30.219261,-97.74391199999999],null,\"0x8644b48864db6491:0x25a5f73b38ad9d82\",null,null,null,0],[\"Woodward/Ben
  White NW Corner\",\"1199\",[\"1445379160\",\"America/Chicago\",\"5:12 PM\",-18000,\"1445379120\"],[\"1445379160\",\"America/Chicago\",\"5:12
  PM\",-18000,\"1445379120\"],[null,null,30.21715,-97.74404],null,\"0x8644b487c98a1859:0xf77faabf8a46110a\",null,null,null,0],[\"Woodward/Ben
  White SW Corner\",\"4318\",[\"1445379209\",\"America/Chicago\",\"5:13 PM\",-18000,\"1445379180\"],[\"1445379209\",\"America/Chicago\",\"5:13
  PM\",-18000,\"1445379180\"],[null,null,30.21464,-97.74469999999999],null,\"0x8644b486e3846989:0xb0761984cdb7061f\",null,null,null,0],[\"4120
  Freidrich/Woodward\",\"4317\",[\"1445379245\",\"America/Chicago\",\"5:14 PM\",-18000,\"1445379240\"],[\"1445379245\",\"America/Chicago\",\"5:14
  PM\",-18000,\"1445379240\"],[null,null,30.213561,-97.74585499999999],null,\"0x8644b486b8f199db:0x220464b14173d0aa\",null,null,null,0],[\"Freidrich/Directors\",\"1202\",[\"1445379298\",\"America/Chicago\",\"5:14
  PM\",-18000,\"1445379240\"],[\"1445379298\",\"America/Chicago\",\"5:14 PM\",-18000,\"1445379240\"],[null,null,30.21249,-97.74821],null,\"0x8644b4840a7545a3:0xd1524cfb80d62b29\",null,null,null,0],[\"4216
  Freidrich/St Elmo\",\"5917\",[\"1445379323\",\"America/Chicago\",\"5:15 PM\",-18000,\"1445379300\"],[\"1445379323\",\"America/Chicago\",\"5:15
  PM\",-18000,\"1445379300\"],[null,null,30.211274,-97.748981],null,\"0x8644b48394723013:0x99d7031b410e5e51\",null,null,null,0]],[[[null,null,\"a\",[1.25,\"$1.25\",\"USD\"]]],1,0],null,0,0,[[[[[4,null,[3,\"bus.png\",null,\"Bus\",[[\"https://maps.gstatic.com/mapfiles/transit/iw2/b/bus.png\",0,[15,15],null,0]]]],[5,[\"7\",1,\"#e11f8f\",\"#000000\"]],[7,[\"towards
  7-Duval / Dove Springs-SB\"]]],[[\"Capital Metro\",\"3508131340849202367\",null,null,\"1
  512-474-1200\",null,null,[\"/url?q=http://www.capmetro.org/\\u0026sa=U\\u0026ved=0CEIQvUwoAjAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNEz-vxk9RiqqKpmZkHhN0Z-I0xxbw\",null,null,\"0CEIQvUwoAjAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],[\"/url?q=http://www.capmetro.org/fares/\\u0026sa=U\\u0026ved=0CEMQkFwoAzAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNFQ1tWq_-9Vs8f5n7JQTGE2f-FYag\",\"Ticket
  information\",null,\"0CEMQkFwoAzAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"]]],\"#e11f8f\",\"7-Duval
  / Dove Springs-SB\"],[1964,\"33 min\",1980],0,26,[1964,\"33 min\",1980]]],null,\"BChIJj3BuQrG1RIYR9ejox2vOL2sQpNSasQU=\",null,[0],[1964,\"33
  min\",1980],\"ChIJU_lAvwu1RIYRZQ9eyOptuzASEgmJjnPrgrREhhGHwX34k2UF-BiQ65qxBSACMgx1cy10eC1hdXN0aW44rA8=\"]],[[null,[392,\"0.2
  mi\",1],[276,\"5 min\",300],2,null,[],null,null,null,[[[989.3443853324784,-97.74945724999999,30.2073526],[0,0,0],[1024,768],13.10000038146973]],null,[[1,null,[3,\"walk.png\",null,\"Walk\",[[\"https://maps.gstatic.com/mapfiles/transit/iw2/b/walk.png\",0,[15,15],null,0]]]],[2,[\"Walk\"]]]],[[[\"\",[37,\"121
  ft\",1],[27,\"27 s\"],2,null,null,null,null,null,[[[2614.43778446428,-97.75090999999999,30.20818],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.20815308042317,-97.75081937544159],[null,null,30.20818,-97.75090999999999]],[null,null,30.20818,-97.75090999999999],null,[[183.8274343002361,-97.7490997714509,30.20764227916735],[-71.03105926513672,45,0],[1024,768],60]],null,[[2,[\"Head
  \"]],[2,[\"southwest\",1]],[2,[\" on \"]],[2,[\"Freidrich Ln\",1]],[2,[\" toward
  \"]],[2,[\"Sponberg Dr\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],534,0],0]]]],[[\"\",[302,\"0.2
  mi\",1],[212,\"4 min\"],2,null,null,null,null,null,[[[2614.437784468795,-97.7510334,30.2078567],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.20801421110194,-97.75093264238593],[null,null,30.2078567,-97.7510334]],[null,null,30.2078567,-97.7510334],null,[[183.8274343005536,-97.75010730020625,30.2093044322054],[-151.0653228759766,45,0],[1024,768],60],[\"OJX2BxwVREsamv6NAmoTYg\",0,1,null,null,515.4652099609375,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=OJX2BxwVREsamv6NAmoTYg\\u0026w=203\\u0026h=100\\u0026yaw=212\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.208028,-97.750924\",\"\",null,[203,100]],null,[[3,-97.75092388002835,30.2080278672752],[212.6128082275391,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CEcQ9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3DOJX2BxwVREsamv6NAmoTYg\\u0026sa=U\\u0026ved=0CEgQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNExn8S9JV-gid3ZNmvgpsSAINdlAQ\",null,null,\"0CEgQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"OJX2BxwVREsamv6NAmoTYg\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.2080278672752,-97.75092388002835]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=OJX2BxwVREsamv6NAmoTYg\"]],2]],null,[[2,[\"Turn
  \"]],[14,[\"left\",1]],[2,[\" at \"]],[2,[\"Sponberg Dr\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],413,0],0]]]],[[\"\",[18,\"59
  ft\",1],[13,\"13 s\"],2,null,null,null,null,null,[[[2614.437784461822,-97.7482873,30.2065332],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.2066211616429,-97.74846898856201],[null,null,30.2065332,-97.7482873]],[null,null,30.2065332,-97.7482873],null,[[183.8274343000633,-97.74995726175909,30.20734168260655],[119.2575378417969,45,0],[1024,768],60]],null,[[2,[\"Turn
  \"]],[14,[\"left\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],413,0],0]]]],[[\"\\u003cstep
  maneuver='TURN' meters='35'\\u003eTurn \\u003cturn side='RIGHT'\\u003eright\\u003c/turn\\u003e\\u003c/step\\u003e\",[35,\"115
  ft\",1],[24,\"24 s\"],2,null,null,null,null,[[null,\"Destination will be on the
  left\",null,null,null,null,null,null,8,null,null,null,null,null,null,1]],[[[2614.437784454084,-97.74819540000001,30.2066761],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.2065332,-97.7482873],[null,null,30.2066761,-97.7481954]],[null,null,30.2066761,-97.7481954],null,[[183.8274342995192,-97.74912528484799,30.20523016502267],[29.06460189819336,45,0],[1024,768],60]],null,[[2,[\"Turn
  \"]],[14,[\"right\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],483,0],0]]]]]]]]],null,[276,\"5
  min\",300]],[[null,[38801,\"24.1 miles\",1],[7881,\"2 h 12 min\",7920],3,[[\"1445372683\",\"America/Chicago\",\"3:24
  PM\",-18000,\"1445372640\"],[\"1445380564\",\"America/Chicago\",\"5:36 PM\",-18000,\"1445380560\"],null,null,[\"1445372683\",\"America/Chicago\",\"3:24
  PM\",-18000,\"1445372640\"],[\"1445380564\",\"America/Chicago\",\"5:36 PM\",-18000,\"1445380560\"]],[null,null,null,null,[[\"Capital
  Metro\",\"3508131340849202367\",null,null,\"1 512-474-1200\",null,null,[\"/url?q=http://www.capmetro.org/\\u0026sa=U\\u0026ved=0CEwQvUwoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNEz-vxk9RiqqKpmZkHhN0Z-I0xxbw\",null,null,\"0CEwQvUwoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],[\"/url?q=http://www.capmetro.org/fares/\\u0026sa=U\\u0026ved=0CE0QkFwoATAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNFQ1tWq_-9Vs8f5n7JQTGE2f-FYag\",\"Ticket
  information\",null,\"0CE0QkFwoATAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"]]]],null,null,null,[null,null,null,[null,null,[null,null,30.2065252,-97.806704],[null,null,30.3592109,-97.712469]]],[2.5,\"$2.50\",\"USD\"],[[1,null,[3,\"drive.png\",null,\"Drive\",[[\"https://maps.gstatic.com/mapfiles/transit/iw2/b/drive.png\",0,[15,15],null,0]]]],[9],[4,null,[3,\"bus.png\",null,\"Bus\",[[\"https://maps.gstatic.com/mapfiles/transit/iw2/b/bus.png\",0,[15,15],null,0]]]],[5,[\"320\",1,\"#658d3c\",\"#000000\"]],[9],[4,null,[3,\"bus.png\",null,\"Bus\",[[\"https://maps.gstatic.com/mapfiles/transit/iw2/b/bus.png\",0,[15,15],null,0]]]],[5,[\"7\",1,\"#e11f8f\",\"#000000\"]]]],[[[],[[[null,[8808,\"5.5
  mi\",1],[613,\"10 min\",600],0,null,[],null,null,null,[[[15570.38629583386,-97.78159095000001,30.3471764],[0,0,0],[1024,768],13.10000038146973]],null,[[1,null,[3,\"drive.png\",null,\"Drive\",[[\"https://maps.gstatic.com/mapfiles/transit/iw2/b/drive.png\",0,[15,15],null,0]]]],[2,[\"Drive/Taxi\"]]]],[[[\"\",[138,\"453
  ft\",1],[15,\"15 s\"],0,null,null,null,null,null,[[[2614.437784468922,-97.8056529,30.3364544],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.33661065557999,-97.80554942283354],[null,null,30.3364544,-97.8056529]],[null,null,30.3364544,-97.8056529],null,[[183.8274343005625,-97.80470180313857,30.33789059336848],[-150.2497253417969,45,0],[1024,768],60],[\"Zcrk0XxZJlH0wVfQN9zyhQ\",0,1,null,null,336.9537353515625,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=Zcrk0XxZJlH0wVfQN9zyhQ\\u0026w=203\\u0026h=100\\u0026yaw=213\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.336624,-97.805540\",\"\",null,[203,100]],null,[[3,-97.80554033599437,30.33662434848343],[213.5181732177734,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CFAQ9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3DZcrk0XxZJlH0wVfQN9zyhQ\\u0026sa=U\\u0026ved=0CFEQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNEFBPu-Uhw9xV3bY-oSC7tT00hUyQ\",null,null,\"0CFEQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"Zcrk0XxZJlH0wVfQN9zyhQ\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.33662434848343,-97.80554033599437]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=Zcrk0XxZJlH0wVfQN9zyhQ\"]],2]],null,[[2,[\"Head
  \"]],[2,[\"southwest\",1]],[2,[\" on \"]],[2,[\"TX-360 Loop S\",1]],[2,[\" toward
  \"]],[2,[\"Westlake Dr\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],534,0],0]]]],[[\"\\u003cstep
  maneuver='UTURN' meters='2638'\\u003eMake a \\u003cturn type='UTURN'\\u003eU-turn\\u003c/turn\\u003e
  at \\u003croadlist\\u003e\\u003croad lang='en'\\u003eWestlake Dr\\u003c/road\\u003e\\u003c/roadlist\\u003e\\u003c/step\\u003e\",[2638,\"1.6
  mi\",1],[183,\"3 min\"],0,null,null,null,null,null,[[[2614.437784459305,-97.80636160000002,30.3353732],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.33552998269339,-97.8062591993514],[null,null,30.3353732,-97.80636160000002]],[null,null,30.3353732,-97.80636160000002],null,[[183.8274342998863,-97.80542039907752,30.33681423626154],[-150.5895233154297,45,0],[1024,768],60],[\"qHp2h562k7IXbApmRI_-aA\",0,1,null,null,388.49658203125,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=qHp2h562k7IXbApmRI_-aA\\u0026w=203\\u0026h=100\\u0026yaw=213\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.335491,-97.806285\",\"\",null,[203,100]],null,[[3,-97.80628483774699,30.33549067914215],[213.1610717773438,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CFMQ9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3DqHp2h562k7IXbApmRI_-aA\\u0026sa=U\\u0026ved=0CFQQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNH2wedSUbAukHn1LqrPS87qLTqC8A\",null,null,\"0CFQQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"qHp2h562k7IXbApmRI_-aA\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.33549067914215,-97.80628483774699]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=qHp2h562k7IXbApmRI_-aA\"]],2]],null,[[2,[\"Make
  a \"]],[14,[\"U-turn\",1]],[2,[\" at \"]],[2,[\"Westlake Dr\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],305,0],0]]]],[[\"\\u003cstep
  maneuver='OFF_RAMP' meters='316'\\u003eTake the \\u003csignlist\\u003e\\u003csign
  lang='en' is_route_number='true'\\u003eRM 2222\\u003c/sign\\u003e\\u003c/signlist\\u003e
  exit\\u003c/step\\u003e\",[316,\"0.2 mi\",1],[18,\"18 s\"],0,null,null,null,null,null,[[[2614.437784477769,-97.79312100000001,30.3555836],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.35542773532633,-97.79322528582357],[null,null,30.3555836,-97.793121]],[null,null,30.3555836,-97.793121],null,[[183.8274343011846,-97.79407953106939,30.35415097855575],[30.00010871887207,45,0],[1024,768],60],[\"M7_HOUQuwbBmpcAUR5W2DA\",0,1,null,null,580.0320434570312,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=M7_HOUQuwbBmpcAUR5W2DA\\u0026w=203\\u0026h=100\\u0026yaw=33\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.355395,-97.793248\",\"\",null,[203,100]],null,[[3,-97.79324756495109,30.35539452713792],[33.79826354980469,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CFYQ9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3DM7_HOUQuwbBmpcAUR5W2DA\\u0026sa=U\\u0026ved=0CFcQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNGGY1YX9HQKMbOqITiM6CtmsHBcHw\",null,null,\"0CFcQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"M7_HOUQuwbBmpcAUR5W2DA\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.35539452713792,-97.79324756495109]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=M7_HOUQuwbBmpcAUR5W2DA\"]],2]],null,[[2,[\"Take
  the \"]],[2,[\"RM 2222\",1]],[2,[\" exit\"]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],429,0],0]]]],[[\"\",[163,\"0.1
  mi\",1],[31,\"31 s\"],0,null,null,null,null,null,[[[2614.437784478283,-97.79117490000002,30.3578558],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.35769438145279,-97.7912671464788],[null,null,30.3578558,-97.7911749]],[null,null,30.3578558,-97.7911749],null,[[183.8274343012207,-97.79202277250623,30.35637213065131],[26.24868965148926,45,0],[1024,768],60],[\"Iq9aiWmwhj8BbmmkW1nAkg\",0,1,null,null,437.5306701660156,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=Iq9aiWmwhj8BbmmkW1nAkg\\u0026w=203\\u0026h=100\\u0026yaw=29\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.357726,-97.791249\",\"\",null,[203,100]],null,[[3,-97.79124914511263,30.35772585365484],[29.7415771484375,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CFkQ9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3DIq9aiWmwhj8BbmmkW1nAkg\\u0026sa=U\\u0026ved=0CFoQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNEH87E6UiUMFrkHMbdGFnCmcncoGQ\",null,null,\"0CFoQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"Iq9aiWmwhj8BbmmkW1nAkg\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.35772585365484,-97.79124914511263]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=Iq9aiWmwhj8BbmmkW1nAkg\"]],2]],null,[[2,[\"Continue
  onto \"]],[2,[\"N Capital of Texas Hwy\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],534,0],0]]]],[[\"\",[5486,\"3.4
  mi\",1],[343,\"6 min\"],0,null,null,null,null,null,[[[2614.437784465454,-97.7905186,30.35921090000001],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.35904360990398,-97.79059552484757],[null,null,30.3592109,-97.7905186]],[null,null,30.3592109,-97.7905186],null,[[183.8274343003187,-97.79122564570686,30.35767326194909],[21.64192771911621,45,0],[1024,768],60],[\"0bmBecM1pqLevJDcIT55Wg\",0,1,null,null,439.5768737792969,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=0bmBecM1pqLevJDcIT55Wg\\u0026w=203\\u0026h=100\\u0026yaw=24\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.359093,-97.790573\",\"\",null,[203,100]],null,[[3,-97.79057298146955,30.3590926196285],[24.69143486022949,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CFwQ9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3D0bmBecM1pqLevJDcIT55Wg\\u0026sa=U\\u0026ved=0CF0Q-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNGCHqyhWHMbXiD9lP2V4OOP40C-iw\",null,null,\"0CF0Q-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"0bmBecM1pqLevJDcIT55Wg\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.3590926196285,-97.79057298146955]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=0bmBecM1pqLevJDcIT55Wg\"]],2]],null,[[2,[\"Turn
  \"]],[14,[\"right\",1]],[2,[\" onto \"]],[2,[\"Ranch to Market 2222 E\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],483,0],0]]]],[[\"\\u003cstep
  maneuver='TURN' meters='67'\\u003eTurn \\u003cturn side='LEFT'\\u003eleft\\u003c/turn\\u003e
  onto \\u003croadlist\\u003e\\u003croad lang='en'\\u003eBalcones Dr\\u003c/road\\u003e\\u003c/roadlist\\u003e\\u003c/step\\u003e\",[67,\"220
  ft\",1],[23,\"23 s\"],0,null,null,null,null,[[null,\"Destination will be on the
  right\",null,null,null,null,null,null,8,null,null,null,null,null,null,2]],[[[2614.437784468421,-97.7571787,30.3374811],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.33757830324543,-97.75735420332924],[null,null,30.3374811,-97.7571787]],[null,null,30.3374811,-97.7571787],null,[[183.8274343005273,-97.75879181485755,30.33837452670841],[122.6894836425781,45,0],[1024,768],60],[\"L779le10Ih46HxAykvObcA\",0,1,null,null,366.0218811035156,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=L779le10Ih46HxAykvObcA\\u0026w=203\\u0026h=100\\u0026yaw=118\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.337573,-97.757345\",\"\",null,[203,100]],null,[[3,-97.75734475461114,30.33757310280168],[118.9887084960938,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CF8Q9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3DL779le10Ih46HxAykvObcA\\u0026sa=U\\u0026ved=0CGAQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNECEto2a1f6y_MIqJB1lGtv-y-Q4A\",null,null,\"0CGAQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"L779le10Ih46HxAykvObcA\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.33757310280168,-97.75734475461114]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=L779le10Ih46HxAykvObcA\"]],2]],null,[[2,[\"Turn
  \"]],[14,[\"left\",1]],[2,[\" onto \"]],[2,[\"Balcones Dr\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],413,0],0]]]]]],[[null,null,[2709,\"46
  min\",2760],3,[[\"1445373296\",\"America/Chicago\",\"3:34 PM\",-18000,\"1445373240\"],[\"1445376005\",\"America/Chicago\",\"4:20
  PM\",-18000,\"1445376000\"],null,null,[\"1445373296\",\"America/Chicago\",\"3:34
  PM\",-18000,\"1445373240\"],[\"1445376005\",\"America/Chicago\",\"4:20 PM\",-18000,\"1445376000\"]],[\"Northland/Balcones\",\"6413
  Airport Blvd (Highland Mall)\",21,\"#658d3c\",[[\"Capital Metro\",\"3508131340849202367\",null,null,\"1
  512-474-1200\",null,null,[\"/url?q=http://www.capmetro.org/\\u0026sa=U\\u0026ved=0CGIQvUwoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNEz-vxk9RiqqKpmZkHhN0Z-I0xxbw\",null,null,\"0CGIQvUwoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],[\"/url?q=http://www.capmetro.org/fares/\\u0026sa=U\\u0026ved=0CGMQkFwoATAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNFQ1tWq_-9Vs8f5n7JQTGE2f-FYag\",\"Ticket
  information\",null,\"0CGMQkFwoATAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"]]],null,null,null,null,null,null,2,[\"Northland/Balcones\",\"2476\",null,[\"1445373296\",\"America/Chicago\",\"3:34
  PM\",-18000,\"1445373240\"],[null,null,30.337707,-97.75675],null,\"0x8644cae40c845b01:0x9cb0b254aefedc34\",null,null,null,0],[\"6413
  Airport Blvd (Highland Mall)\",\"5602\",[\"1445376005\",\"America/Chicago\",\"4:20
  PM\",-18000,\"1445376000\"],null,[null,null,30.328657,-97.715763],null,\"0x8644ca3eb66e1a41:0xb64b901181cd2c88\",null,null,null,0],[[\"5801
  Balcones/Northland\",\"1881\",[\"1445373324\",\"America/Chicago\",\"3:35 PM\",-18000,\"1445373300\"],[\"1445373324\",\"America/Chicago\",\"3:35
  PM\",-18000,\"1445373300\"],[null,null,30.339491,-97.75564899999999],null,\"0x8644cae398c6e0d9:0x43bad95f4fc9bce1\",null,null,null,0],[\"6101
  Balcones/Northland\",\"1882\",[\"1445373386\",\"America/Chicago\",\"3:36 PM\",-18000,\"1445373360\"],[\"1445373386\",\"America/Chicago\",\"3:36
  PM\",-18000,\"1445373360\"],[null,null,30.34337,-97.75318],null,\"0x8644cae2aff0662d:0x8ab2f25bacf5d083\",null,null,null,0],[\"North
  Hills/Valleyside\",\"4651\",[\"1445373498\",\"America/Chicago\",\"3:38 PM\",-18000,\"1445373480\"],[\"1445373498\",\"America/Chicago\",\"3:38
  PM\",-18000,\"1445373480\"],[null,null,30.34922,-97.75417999999999],null,\"0x8644cb1c996fb54b:0x4b8e30c22e5413bf\",null,null,null,0],[\"3600
  North Hills/Village Center\",\"3513\",[\"1445373544\",\"America/Chicago\",\"3:39
  PM\",-18000,\"1445373540\"],[\"1445373544\",\"America/Chicago\",\"3:39 PM\",-18000,\"1445373540\"],[null,null,30.351595,-97.75666299999999],null,\"0x8644cb1bc7918027:0x8a9ae38f9a5a5ef2\",null,null,null,0],[\"7053
  Village Center/Far West\",\"5656\",[\"1445373600\",\"America/Chicago\",\"3:40 PM\",-18000,\"1445373600\"],[\"1445374320\",\"America/Chicago\",\"3:52
  PM\",-18000,\"1445374320\"],[null,null,30.353195,-97.75575499999999],null,\"0x8644cb1a5a7f8c79:0xe82054f717eb2f4e\",null,null,null,0],[\"6714
  Wood Hollow/Far West\",\"1922\",[\"1445374457\",\"America/Chicago\",\"3:54 PM\",-18000,\"1445374440\"],[\"1445374457\",\"America/Chicago\",\"3:54
  PM\",-18000,\"1445374440\"],[null,null,30.35077,-97.75485999999999],null,\"0x8644cb1b72701f3f:0x79edbf8fb01fec3\",null,null,null,0],[\"North
  Hills/Valleyside SE Corner\",\"1923\",[\"1445374512\",\"America/Chicago\",\"3:55
  PM\",-18000,\"1445374500\"],[\"1445374512\",\"America/Chicago\",\"3:55 PM\",-18000,\"1445374500\"],[null,null,30.34881,-97.75376999999999],null,\"0x8644cb1cbda5ef31:0x20ee8408e730cc4f\",null,null,null,0],[\"Balcones/Hart\",\"5421\",[\"1445374678\",\"America/Chicago\",\"3:57
  PM\",-18000,\"1445374620\"],[\"1445374678\",\"America/Chicago\",\"3:57 PM\",-18000,\"1445374620\"],[null,null,30.3424,-97.75404999999999],null,\"0x8644cae2eafc2b77:0x1e9abd8bc81b61d1\",null,null,null,0],[\"5758
  Balcones/Hart\",\"1925\",[\"1445374739\",\"America/Chicago\",\"3:58 PM\",-18000,\"1445374680\"],[\"1445374739\",\"America/Chicago\",\"3:58
  PM\",-18000,\"1445374680\"],[null,null,30.339599,-97.755793],null,\"0x8644cae398c6e0d9:0x43bad95f4fc9bce1\",null,null,null,0],[\"Northland/Marilyn\",\"2419\",[\"1445374893\",\"America/Chicago\",\"4:01
  PM\",-18000,\"1445374860\"],[\"1445374893\",\"America/Chicago\",\"4:01 PM\",-18000,\"1445374860\"],[null,null,30.334546,-97.75183199999999],null,\"0x8644cafac5c02b53:0xfc534f0bdd253f39\",null,null,null,0],[\"2607
  Allandale/Cary\",\"4588\",[\"1445374976\",\"America/Chicago\",\"4:02 PM\",-18000,\"1445374920\"],[\"1445374976\",\"America/Chicago\",\"4:02
  PM\",-18000,\"1445374920\"],[null,null,30.33533,-97.747],null,\"0x8644caf98126d07b:0xcf9e050c687f04b1\",null,null,null,0],[\"Allandale/Shoalwood\",\"2421\",[\"1445375045\",\"America/Chicago\",\"4:04
  PM\",-18000,\"1445375040\"],[\"1445375045\",\"America/Chicago\",\"4:04 PM\",-18000,\"1445375040\"],[null,null,30.33515,-97.7431],null,\"0x8644caf8428a67dd:0xdc81158332f08961\",null,null,null,0],[\"Allandale/Burnet
  SW Corner\",\"2422\",[\"1445375100\",\"America/Chicago\",\"4:05 PM\",-18000,\"1445375100\"],[\"1445375100\",\"America/Chicago\",\"4:05
  PM\",-18000,\"1445375100\"],[null,null,30.33474,-97.74006999999999],null,\"0x8644ca5795927b3d:0x526e82bbaa0c1a17\",null,null,null,0],[\"1601
  Koenig/Arroyo Seco\",\"2423\",[\"1445375216\",\"America/Chicago\",\"4:06 PM\",-18000,\"1445375160\"],[\"1445375216\",\"America/Chicago\",\"4:06
  PM\",-18000,\"1445375160\"],[null,null,30.332402,-97.734922],null,\"0x8644ca5a15280961:0x44e97c9fade3eaae\",null,null,null,0],[\"1317
  Koenig/Woodrow\",\"2424\",[\"1445375300\",\"America/Chicago\",\"4:08 PM\",-18000,\"1445375280\"],[\"1445375300\",\"America/Chicago\",\"4:08
  PM\",-18000,\"1445375280\"],[null,null,30.33063,-97.73122499999999],null,\"0x8644ca5b2eb66d8d:0xfedc93e0ed1c1602\",null,null,null,0],[\"1205
  Koenig/Grover\",\"2425\",[\"1445375336\",\"America/Chicago\",\"4:08 PM\",-18000,\"1445375280\"],[\"1445375336\",\"America/Chicago\",\"4:08
  PM\",-18000,\"1445375280\"],[null,null,30.329871,-97.729641],null,\"0x8644ca44c103e0e5:0x61392b73cea455a4\",null,null,null,0],[\"815
  Koenig/Lamar\",\"5393\",[\"1445375442\",\"America/Chicago\",\"4:10 PM\",-18000,\"1445375400\"],[\"1445375442\",\"America/Chicago\",\"4:10
  PM\",-18000,\"1445375400\"],[null,null,30.326319,-97.72697099999999],null,\"0x8644ca43b8d0ef05:0xbbf7c16ee130fd1c\",null,null,null,0],[\"Koenig/Guadalupe
  SW Corner\",\"2427\",[\"1445375531\",\"America/Chicago\",\"4:12 PM\",-18000,\"1445375520\"],[\"1445375531\",\"America/Chicago\",\"4:12
  PM\",-18000,\"1445375520\"],[null,null,30.323488,-97.72402099999999],null,\"0x8644ca41e7f5ed63:0xaa96a8d9ec0b893b\",null,null,null,0],[\"111
  Koenig/Avenue F\",\"2428\",[\"1445375643\",\"America/Chicago\",\"4:14 PM\",-18000,\"1445375640\"],[\"1445375643\",\"America/Chicago\",\"4:14
  PM\",-18000,\"1445375640\"],[null,null,30.32193,-97.71875999999999],null,\"0x8644ca1541073e99:0x350350bb3d02a590\",null,null,null,0],[\"5815
  Airport/Koenig\",\"1797\",[\"1445375866\",\"America/Chicago\",\"4:17 PM\",-18000,\"1445375820\"],[\"1445375866\",\"America/Chicago\",\"4:17
  PM\",-18000,\"1445375820\"],[null,null,30.322861,-97.71489799999999],null,\"0x8644ca15fb9ccc0b:0xb6846d9d825c9fed\",null,null,null,0]],[[[null,null,\"a\",[1.25,\"$1.25\",\"USD\"]]],1,0]],null,null,null,[[[2614.437784466414,-97.75675000000001,30.33770699999999],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.33765774644284,-97.75666273756572],[null,null,30.337707,-97.75675]],[null,null,30.337707,-97.75675],null,[[183.8274343003862,-97.75514587724273,30.33680158064022],[-56.81593322753906,45,0],[1024,768],60]],[1.25,\"$1.25\",\"USD\"],[[4,null,[3,\"bus.png\",null,\"Bus\",[[\"https://maps.gstatic.com/mapfiles/transit/iw2/b/bus.png\",0,[15,15],null,0]]]],[5,[\"320\",1,\"#658d3c\",\"#000000\"]],[7,[\"towards
  320-St Johns-NB\"]]]],null,[[\"Northland/Balcones\",\"2476\",null,[\"1445373296\",\"America/Chicago\",\"3:34
  PM\",-18000,\"1445373240\"],[null,null,30.337707,-97.75675],null,\"0x8644cae40c845b01:0x9cb0b254aefedc34\",null,null,null,0],[\"6413
  Airport Blvd (Highland Mall)\",\"5602\",[\"1445376005\",\"America/Chicago\",\"4:20
  PM\",-18000,\"1445376000\"],null,[null,null,30.328657,-97.715763],null,\"0x8644ca3eb66e1a41:0xb64b901181cd2c88\",null,null,null,0],21,\"#658d3c\",0,null,2,[[\"5801
  Balcones/Northland\",\"1881\",[\"1445373324\",\"America/Chicago\",\"3:35 PM\",-18000,\"1445373300\"],[\"1445373324\",\"America/Chicago\",\"3:35
  PM\",-18000,\"1445373300\"],[null,null,30.339491,-97.75564899999999],null,\"0x8644cae398c6e0d9:0x43bad95f4fc9bce1\",null,null,null,0],[\"6101
  Balcones/Northland\",\"1882\",[\"1445373386\",\"America/Chicago\",\"3:36 PM\",-18000,\"1445373360\"],[\"1445373386\",\"America/Chicago\",\"3:36
  PM\",-18000,\"1445373360\"],[null,null,30.34337,-97.75318],null,\"0x8644cae2aff0662d:0x8ab2f25bacf5d083\",null,null,null,0],[\"North
  Hills/Valleyside\",\"4651\",[\"1445373498\",\"America/Chicago\",\"3:38 PM\",-18000,\"1445373480\"],[\"1445373498\",\"America/Chicago\",\"3:38
  PM\",-18000,\"1445373480\"],[null,null,30.34922,-97.75417999999999],null,\"0x8644cb1c996fb54b:0x4b8e30c22e5413bf\",null,null,null,0],[\"3600
  North Hills/Village Center\",\"3513\",[\"1445373544\",\"America/Chicago\",\"3:39
  PM\",-18000,\"1445373540\"],[\"1445373544\",\"America/Chicago\",\"3:39 PM\",-18000,\"1445373540\"],[null,null,30.351595,-97.75666299999999],null,\"0x8644cb1bc7918027:0x8a9ae38f9a5a5ef2\",null,null,null,0],[\"7053
  Village Center/Far West\",\"5656\",[\"1445373600\",\"America/Chicago\",\"3:40 PM\",-18000,\"1445373600\"],[\"1445374320\",\"America/Chicago\",\"3:52
  PM\",-18000,\"1445374320\"],[null,null,30.353195,-97.75575499999999],null,\"0x8644cb1a5a7f8c79:0xe82054f717eb2f4e\",null,null,null,0],[\"6714
  Wood Hollow/Far West\",\"1922\",[\"1445374457\",\"America/Chicago\",\"3:54 PM\",-18000,\"1445374440\"],[\"1445374457\",\"America/Chicago\",\"3:54
  PM\",-18000,\"1445374440\"],[null,null,30.35077,-97.75485999999999],null,\"0x8644cb1b72701f3f:0x79edbf8fb01fec3\",null,null,null,0],[\"North
  Hills/Valleyside SE Corner\",\"1923\",[\"1445374512\",\"America/Chicago\",\"3:55
  PM\",-18000,\"1445374500\"],[\"1445374512\",\"America/Chicago\",\"3:55 PM\",-18000,\"1445374500\"],[null,null,30.34881,-97.75376999999999],null,\"0x8644cb1cbda5ef31:0x20ee8408e730cc4f\",null,null,null,0],[\"Balcones/Hart\",\"5421\",[\"1445374678\",\"America/Chicago\",\"3:57
  PM\",-18000,\"1445374620\"],[\"1445374678\",\"America/Chicago\",\"3:57 PM\",-18000,\"1445374620\"],[null,null,30.3424,-97.75404999999999],null,\"0x8644cae2eafc2b77:0x1e9abd8bc81b61d1\",null,null,null,0],[\"5758
  Balcones/Hart\",\"1925\",[\"1445374739\",\"America/Chicago\",\"3:58 PM\",-18000,\"1445374680\"],[\"1445374739\",\"America/Chicago\",\"3:58
  PM\",-18000,\"1445374680\"],[null,null,30.339599,-97.755793],null,\"0x8644cae398c6e0d9:0x43bad95f4fc9bce1\",null,null,null,0],[\"Northland/Marilyn\",\"2419\",[\"1445374893\",\"America/Chicago\",\"4:01
  PM\",-18000,\"1445374860\"],[\"1445374893\",\"America/Chicago\",\"4:01 PM\",-18000,\"1445374860\"],[null,null,30.334546,-97.75183199999999],null,\"0x8644cafac5c02b53:0xfc534f0bdd253f39\",null,null,null,0],[\"2607
  Allandale/Cary\",\"4588\",[\"1445374976\",\"America/Chicago\",\"4:02 PM\",-18000,\"1445374920\"],[\"1445374976\",\"America/Chicago\",\"4:02
  PM\",-18000,\"1445374920\"],[null,null,30.33533,-97.747],null,\"0x8644caf98126d07b:0xcf9e050c687f04b1\",null,null,null,0],[\"Allandale/Shoalwood\",\"2421\",[\"1445375045\",\"America/Chicago\",\"4:04
  PM\",-18000,\"1445375040\"],[\"1445375045\",\"America/Chicago\",\"4:04 PM\",-18000,\"1445375040\"],[null,null,30.33515,-97.7431],null,\"0x8644caf8428a67dd:0xdc81158332f08961\",null,null,null,0],[\"Allandale/Burnet
  SW Corner\",\"2422\",[\"1445375100\",\"America/Chicago\",\"4:05 PM\",-18000,\"1445375100\"],[\"1445375100\",\"America/Chicago\",\"4:05
  PM\",-18000,\"1445375100\"],[null,null,30.33474,-97.74006999999999],null,\"0x8644ca5795927b3d:0x526e82bbaa0c1a17\",null,null,null,0],[\"1601
  Koenig/Arroyo Seco\",\"2423\",[\"1445375216\",\"America/Chicago\",\"4:06 PM\",-18000,\"1445375160\"],[\"1445375216\",\"America/Chicago\",\"4:06
  PM\",-18000,\"1445375160\"],[null,null,30.332402,-97.734922],null,\"0x8644ca5a15280961:0x44e97c9fade3eaae\",null,null,null,0],[\"1317
  Koenig/Woodrow\",\"2424\",[\"1445375300\",\"America/Chicago\",\"4:08 PM\",-18000,\"1445375280\"],[\"1445375300\",\"America/Chicago\",\"4:08
  PM\",-18000,\"1445375280\"],[null,null,30.33063,-97.73122499999999],null,\"0x8644ca5b2eb66d8d:0xfedc93e0ed1c1602\",null,null,null,0],[\"1205
  Koenig/Grover\",\"2425\",[\"1445375336\",\"America/Chicago\",\"4:08 PM\",-18000,\"1445375280\"],[\"1445375336\",\"America/Chicago\",\"4:08
  PM\",-18000,\"1445375280\"],[null,null,30.329871,-97.729641],null,\"0x8644ca44c103e0e5:0x61392b73cea455a4\",null,null,null,0],[\"815
  Koenig/Lamar\",\"5393\",[\"1445375442\",\"America/Chicago\",\"4:10 PM\",-18000,\"1445375400\"],[\"1445375442\",\"America/Chicago\",\"4:10
  PM\",-18000,\"1445375400\"],[null,null,30.326319,-97.72697099999999],null,\"0x8644ca43b8d0ef05:0xbbf7c16ee130fd1c\",null,null,null,0],[\"Koenig/Guadalupe
  SW Corner\",\"2427\",[\"1445375531\",\"America/Chicago\",\"4:12 PM\",-18000,\"1445375520\"],[\"1445375531\",\"America/Chicago\",\"4:12
  PM\",-18000,\"1445375520\"],[null,null,30.323488,-97.72402099999999],null,\"0x8644ca41e7f5ed63:0xaa96a8d9ec0b893b\",null,null,null,0],[\"111
  Koenig/Avenue F\",\"2428\",[\"1445375643\",\"America/Chicago\",\"4:14 PM\",-18000,\"1445375640\"],[\"1445375643\",\"America/Chicago\",\"4:14
  PM\",-18000,\"1445375640\"],[null,null,30.32193,-97.71875999999999],null,\"0x8644ca1541073e99:0x350350bb3d02a590\",null,null,null,0],[\"5815
  Airport/Koenig\",\"1797\",[\"1445375866\",\"America/Chicago\",\"4:17 PM\",-18000,\"1445375820\"],[\"1445375866\",\"America/Chicago\",\"4:17
  PM\",-18000,\"1445375820\"],[null,null,30.322861,-97.71489799999999],null,\"0x8644ca15fb9ccc0b:0xb6846d9d825c9fed\",null,null,null,0]],[[[null,null,\"a\",[1.25,\"$1.25\",\"USD\"]]],1,0],null,0,0,[[[[[4,null,[3,\"bus.png\",null,\"Bus\",[[\"https://maps.gstatic.com/mapfiles/transit/iw2/b/bus.png\",0,[15,15],null,0]]]],[5,[\"320\",1,\"#658d3c\",\"#000000\"]],[7,[\"towards
  320-St Johns-NB\"]]],[[\"Capital Metro\",\"3508131340849202367\",null,null,\"1 512-474-1200\",null,null,[\"/url?q=http://www.capmetro.org/\\u0026sa=U\\u0026ved=0CGQQvUwoAjAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNEz-vxk9RiqqKpmZkHhN0Z-I0xxbw\",null,null,\"0CGQQvUwoAjAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],[\"/url?q=http://www.capmetro.org/fares/\\u0026sa=U\\u0026ved=0CGUQkFwoAzAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNFQ1tWq_-9Vs8f5n7JQTGE2f-FYag\",\"Ticket
  information\",null,\"0CGUQkFwoAzAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"]]],\"#658d3c\",\"320-St
  Johns-NB\"],[2709,\"46 min\",2760],0,21,[2709,\"46 min\",2760]]],null,\"BChIJAy89Hoy1RIYR9tUPSuy3hUkQvKSasQU=\",null,[0],[2709,\"46
  min\",2760],\"ChIJAVuEDOTKRIYRNNz-rlSysJwSEglBGm62PspEhhGILM2BEZBLthjwypqxBSACMgx1cy10eC1hdXN0aW44lRU=\"]],[[null,null,[60,\"1
  min\",60],2,null,[],null,null,null,[[[2614.43778445375,-97.71576300000001,30.328657],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.3287932441204,-97.71562675587958],[null,null,30.328657,-97.715763]],[null,null,30.328657,-97.715763],null,[[183.8274342994958,-97.71451072927658,30.32990926358839],[-139.2011260986328,45,0],[1024,768],60],[\"0wyD4tmQAGYw1AfhS6Hl9g\",0,1,null,null,330.1862487792969,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=0wyD4tmQAGYw1AfhS6Hl9g\\u0026w=203\\u0026h=100\\u0026yaw=229\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.328743,-97.715662\",\"\",null,[203,100]],null,[[3,-97.71566244604682,30.32874335950624],[229.3427734375,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CGcQ9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3D0wyD4tmQAGYw1AfhS6Hl9g\\u0026sa=U\\u0026ved=0CGgQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNEVrWGp_bZqTNj-feT0HfCPjIW05g\",null,null,\"0CGgQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"0wyD4tmQAGYw1AfhS6Hl9g\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.32874335950624,-97.71566244604682]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=0wyD4tmQAGYw1AfhS6Hl9g\"]],2]],null,[[1,null,[3,\"walk.png\",null,\"Walk\",[[\"https://maps.gstatic.com/mapfiles/transit/iw2/b/walk.png\",0,[15,15],null,0]]]],[2,[\"Walk\"]]]]],[[null,null,[3860,\"1
  h 4 min\",3840],3,[[\"1445376428\",\"America/Chicago\",\"4:27 PM\",-18000,\"1445376420\"],[\"1445380288\",\"America/Chicago\",\"5:31
  PM\",-18000,\"1445380260\"],null,null,[\"1445376428\",\"America/Chicago\",\"4:27
  PM\",-18000,\"1445376420\"],[\"1445380288\",\"America/Chicago\",\"5:31 PM\",-18000,\"1445380260\"]],[\"6402
  Airport Blvd (Highland Mall)\",\"4600 Freidrich/St Elmo\",52,\"#e11f8f\",[[\"Capital
  Metro\",\"3508131340849202367\",null,null,\"1 512-474-1200\",null,null,[\"/url?q=http://www.capmetro.org/\\u0026sa=U\\u0026ved=0CGoQvUwoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNEz-vxk9RiqqKpmZkHhN0Z-I0xxbw\",null,null,\"0CGoQvUwoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],[\"/url?q=http://www.capmetro.org/fares/\\u0026sa=U\\u0026ved=0CGsQkFwoATAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNFQ1tWq_-9Vs8f5n7JQTGE2f-FYag\",\"Ticket
  information\",null,\"0CGsQkFwoATAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"]]],null,null,null,null,null,null,2,[\"6402
  Airport Blvd (Highland Mall)\",\"5603\",null,[\"1445376428\",\"America/Chicago\",\"4:27
  PM\",-18000,\"1445376420\"],[null,null,30.328339,-97.716081],null,\"0x8644ca3ec8832725:0xc51abc688ea6b523\",null,null,null,0],[\"4600
  Freidrich/St Elmo\",\"1203\",[\"1445380288\",\"America/Chicago\",\"5:31 PM\",-18000,\"1445380260\"],null,[null,null,30.20818,-97.75090999999999],null,\"0x8644b482eb738e89:0xf8056593f87dc187\",null,null,null,0],[[\"5789
  Airport/Koenig\",\"5625\",[\"1445376579\",\"America/Chicago\",\"4:29 PM\",-18000,\"1445376540\"],[\"1445376579\",\"America/Chicago\",\"4:29
  PM\",-18000,\"1445376540\"],[null,null,30.321647,-97.71395],null,\"0x8644ca167189d9bd:0xcfa72d6020fe8be2\",null,null,null,0],[\"5600
  Avenue F/56th\",\"1164\",[\"1445376720\",\"America/Chicago\",\"4:32 PM\",-18000,\"1445376720\"],[\"1445376720\",\"America/Chicago\",\"4:32
  PM\",-18000,\"1445376720\"],[null,null,30.32117,-97.71899999999999],null,\"0x8644ca153b75ecb1:0xb81cac8814aefaff\",null,null,null,0],[\"5500
  Avenue F/55th\",\"1165\",[\"1445376749\",\"America/Chicago\",\"4:32 PM\",-18000,\"1445376720\"],[\"1445376749\",\"America/Chicago\",\"4:32
  PM\",-18000,\"1445376720\"],[null,null,30.31993,-97.71978999999999],null,\"0x8644ca14d4891fa9:0xb8eb8522cfadf62c\",null,null,null,0],[\"303
  53RD/Avenue G\",\"1167\",[\"1445376825\",\"America/Chicago\",\"4:33 PM\",-18000,\"1445376780\"],[\"1445376825\",\"America/Chicago\",\"4:33
  PM\",-18000,\"1445376780\"],[null,null,30.317091,-97.720114],null,\"0x8644ca6cab0a7419:0x5cb44286f1e7c5a1\",null,null,null,0],[\"Duval/51ST\",\"1168\",[\"1445376906\",\"America/Chicago\",\"4:35
  PM\",-18000,\"1445376900\"],[\"1445376906\",\"America/Chicago\",\"4:35 PM\",-18000,\"1445376900\"],[null,null,30.314362,-97.719922],null,\"0x8644ca12d5318da9:0xc41141a40dd2caec\",null,null,null,0],[\"Duval/48th\",\"1169\",[\"1445376988\",\"America/Chicago\",\"4:36
  PM\",-18000,\"1445376960\"],[\"1445376988\",\"America/Chicago\",\"4:36 PM\",-18000,\"1445376960\"],[null,null,30.31097,-97.72212999999999],null,\"0x8644ca7284fdd4ab:0xcfce14e783c21f7f\",null,null,null,0],[\"4510
  Duval/45th\",\"4150\",[\"1445377080\",\"America/Chicago\",\"4:38 PM\",-18000,\"1445377080\"],[\"1445377080\",\"America/Chicago\",\"4:38
  PM\",-18000,\"1445377080\"],[null,null,30.307337,-97.724462],null,\"0x8644ca73c38dfcd3:0x3c7b39e6ce1fe5b9\",null,null,null,0],[\"Duval/43RD\",\"1171\",[\"1445377161\",\"America/Chicago\",\"4:39
  PM\",-18000,\"1445377140\"],[\"1445377161\",\"America/Chicago\",\"4:39 PM\",-18000,\"1445377140\"],[null,null,30.30438,-97.72635699999999],null,\"0x8644ca76bc1a9ea9:0x3efd215b542f7b90\",null,null,null,0],[\"4002
  Duval/41ST\",\"1172\",[\"1445377235\",\"America/Chicago\",\"4:40 PM\",-18000,\"1445377200\"],[\"1445377235\",\"America/Chicago\",\"4:40
  PM\",-18000,\"1445377200\"],[null,null,30.301674,-97.728038],null,\"0x8644ca764d2680ed:0x1cccde210ec2dfa7\",null,null,null,0],[\"3508
  Duval/38th\",\"4152\",[\"1445377331\",\"America/Chicago\",\"4:42 PM\",-18000,\"1445377320\"],[\"1445377331\",\"America/Chicago\",\"4:42
  PM\",-18000,\"1445377320\"],[null,null,30.298182,-97.730215],null,\"0x8644b5880d389861:0x388c89b908f02ec8\",null,null,null,0],[\"Duval/33RD\",\"1174\",[\"1445377401\",\"America/Chicago\",\"4:43
  PM\",-18000,\"1445377380\"],[\"1445377401\",\"America/Chicago\",\"4:43 PM\",-18000,\"1445377380\"],[null,null,30.295649,-97.731832],null,\"0x8644b5863bd667b9:0x6b4530f0032f8934\",null,null,null,0],[\"3200
  Duval/32ND\",\"1175\",[\"1445377429\",\"America/Chicago\",\"4:43 PM\",-18000,\"1445377380\"],[\"1445377429\",\"America/Chicago\",\"4:43
  PM\",-18000,\"1445377380\"],[null,null,30.294603,-97.732495],null,\"0x8644b5866c2a2e7f:0x1cefc0f75a25975\",null,null,null,0],[\"Duval/30th\",\"1176\",[\"1445377504\",\"America/Chicago\",\"4:45
  PM\",-18000,\"1445377500\"],[\"1445377504\",\"America/Chicago\",\"4:45 PM\",-18000,\"1445377500\"],[null,null,30.291876,-97.734222],null,\"0x8644b58446221e3b:0x5f85d6750d6e9f4b\",null,null,null,0],[\"San
  Jacinto/Dean Keeton NW Corner\",\"1177\",[\"1445377563\",\"America/Chicago\",\"4:46
  PM\",-18000,\"1445377560\"],[\"1445377563\",\"America/Chicago\",\"4:46 PM\",-18000,\"1445377560\"],[null,null,30.289599,-97.734686],null,\"0x8644b584eb86b96d:0x9a0a53fa5d910dca\",null,null,null,0],[\"2400
  San Jacinto/24th\",\"1178\",[\"1445377625\",\"America/Chicago\",\"4:47 PM\",-18000,\"1445377620\"],[\"1445377625\",\"America/Chicago\",\"4:47
  PM\",-18000,\"1445377620\"],[null,null,30.28725,-97.73366],null,\"0x8644b59b28677297:0xf55a4f42d1757f4e\",null,null,null,0],[\"2300
  San Jacinto/23RD\",\"1179\",[\"1445377668\",\"America/Chicago\",\"4:47 PM\",-18000,\"1445377620\"],[\"1445377668\",\"America/Chicago\",\"4:47
  PM\",-18000,\"1445377620\"],[null,null,30.2855,-97.73378],null,\"0x8644b59afe03f837:0xb5b5e26b78bdb6f7\",null,null,null,0],[\"2100
  San Jacinto/21ST\",\"1180\",[\"1445377720\",\"America/Chicago\",\"4:48 PM\",-18000,\"1445377680\"],[\"1445377720\",\"America/Chicago\",\"4:48
  PM\",-18000,\"1445377680\"],[null,null,30.28336,-97.73416999999999],null,\"0x8644b59bc8866873:0x34cc5f7257129b40\",null,null,null,0],[\"1960
  San Jacinto/Trinity\",\"1181\",[\"1445377794\",\"America/Chicago\",\"4:49 PM\",-18000,\"1445377740\"],[\"1445377794\",\"America/Chicago\",\"4:49
  PM\",-18000,\"1445377740\"],[null,null,30.28066,-97.73389999999999],null,\"0x8644b5990c3b28fd:0x7afce830f0a5c2bd\",null,null,null,0],[\"1806
  San Jacinto/Martin Luther King\",\"915\",[\"1445377849\",\"America/Chicago\",\"4:50
  PM\",-18000,\"1445377800\"],[\"1445377849\",\"America/Chicago\",\"4:50 PM\",-18000,\"1445377800\"],[null,null,30.279508,-97.736019],null,\"0x8644b5992c77d977:0xefb47f790bd1c9ce\",null,null,null,0],[\"San
  Jacinto/17th\",\"916\",[\"1445377882\",\"America/Chicago\",\"4:51 PM\",-18000,\"1445377860\"],[\"1445377882\",\"America/Chicago\",\"4:51
  PM\",-18000,\"1445377860\"],[null,null,30.27816,-97.73649999999999],null,\"0x8644b59f33c71d1d:0x227c4c53f2b1ec25\",null,null,null,0],[\"San
  Jacinto/15th\",\"918\",[\"1445377926\",\"America/Chicago\",\"4:52 PM\",-18000,\"1445377920\"],[\"1445377926\",\"America/Chicago\",\"4:52
  PM\",-18000,\"1445377920\"],[null,null,30.27641,-97.73718],null,\"0x8644b59f578a9fb7:0xd278bab8817994ed\",null,null,null,0],[\"San
  Jacinto/14th\",\"919\",[\"1445377950\",\"America/Chicago\",\"4:52 PM\",-18000,\"1445377920\"],[\"1445377950\",\"America/Chicago\",\"4:52
  PM\",-18000,\"1445377920\"],[null,null,30.275451,-97.737526],null,\"0x8644b5a1e80c6e77:0x9fd972b53934176f\",null,null,null,0],[\"San
  Jacinto/13th\",\"920\",[\"1445377974\",\"America/Chicago\",\"4:52 PM\",-18000,\"1445377920\"],[\"1445377974\",\"America/Chicago\",\"4:52
  PM\",-18000,\"1445377920\"],[null,null,30.2745,-97.73786],null,\"0x8644b5a1bec3cc9d:0xff58a3423fbc15a6\",null,null,null,0],[\"San
  Jacinto/12th\",\"921\",[\"1445378002\",\"America/Chicago\",\"4:53 PM\",-18000,\"1445377980\"],[\"1445378002\",\"America/Chicago\",\"4:53
  PM\",-18000,\"1445377980\"],[null,null,30.27339,-97.73827999999999],null,\"0x8644b5a1a8759783:0xe9b1af6d4b8135a3\",null,null,null,0],[\"San
  Jacinto/11th\",\"922\",[\"1445378040\",\"America/Chicago\",\"4:54 PM\",-18000,\"1445378040\"],[\"1445378040\",\"America/Chicago\",\"4:54
  PM\",-18000,\"1445378040\"],[null,null,30.27221,-97.73872],null,\"0x8644b5a119136f7d:0x9a35fcb04ce9a36d\",null,null,null,0],[\"Guadalupe/8th\",\"5950\",[\"1445378324\",\"America/Chicago\",\"4:58
  PM\",-18000,\"1445378280\"],[\"1445378324\",\"America/Chicago\",\"4:58 PM\",-18000,\"1445378280\"],[null,null,30.271503,-97.74547799999999],null,\"0x8644b50bbf40f953:0x30bb6deac85e0f65\",null,null,null,0],[\"Guadalupe/4th\",\"2613\",[\"1445378483\",\"America/Chicago\",\"5:01
  PM\",-18000,\"1445378460\"],[\"1445378483\",\"America/Chicago\",\"5:01 PM\",-18000,\"1445378460\"],[null,null,30.26733,-97.74704],null,\"0x8644b5092b43859b:0xe33cd1c6a63c2ad\",null,null,null,0],[\"Auditorium
  Shores Station (SB)\",\"2763\",[\"1445378813\",\"America/Chicago\",\"5:06 PM\",-18000,\"1445378760\"],[\"1445378813\",\"America/Chicago\",\"5:06
  PM\",-18000,\"1445378760\"],[null,null,30.258767,-97.7487],null,\"0x8644b50473943fbd:0x15281c44b9c8d148\",null,null,null,0],[\"Riverside/Congress
  FS\",\"3846\",[\"1445378940\",\"America/Chicago\",\"5:09 PM\",-18000,\"1445378940\"],[\"1445378940\",\"America/Chicago\",\"5:09
  PM\",-18000,\"1445378940\"],[null,null,30.2562,-97.74602],null,\"0x8644b50172312a59:0xb3277b1f1bd67dcf\",null,null,null,0],[\"205
  Riverside/Congress\",\"3847\",[\"1445378970\",\"America/Chicago\",\"5:09 PM\",-18000,\"1445378940\"],[\"1445378970\",\"America/Chicago\",\"5:09
  PM\",-18000,\"1445378940\"],[null,null,30.254846,-97.744793],null,\"0x8644b501b199e399:0x217c3a29018eeb0\",null,null,null,0],[\"325
  Riverside/Newning\",\"5023\",[\"1445378995\",\"America/Chicago\",\"5:09 PM\",-18000,\"1445378940\"],[\"1445378995\",\"America/Chicago\",\"5:09
  PM\",-18000,\"1445378940\"],[null,null,30.25359,-97.743972],null,\"0x8644b50031e21013:0xb7367e2f3fadcffb\",null,null,null,0],[\"715
  Riverside/Alameda\",\"1186\",[\"1445379068\",\"America/Chicago\",\"5:11 PM\",-18000,\"1445379060\"],[\"1445379068\",\"America/Chicago\",\"5:11
  PM\",-18000,\"1445379060\"],[null,null,30.25073,-97.74060999999999],null,\"0x8644b45573d27435:0x77213f76cb9fdc5f\",null,null,null,0],[\"1005
  East Riverside/Travis Heights\",\"1187\",[\"1445379108\",\"America/Chicago\",\"5:11
  PM\",-18000,\"1445379060\"],[\"1445379108\",\"America/Chicago\",\"5:11 PM\",-18000,\"1445379060\"],[null,null,30.24959,-97.73835],null,\"0x8644b4544fe6361d:0x71572d34c74f16fd\",null,null,null,0],[\"Riverside/Kenwood\",\"1188\",[\"1445379137\",\"America/Chicago\",\"5:12
  PM\",-18000,\"1445379120\"],[\"1445379137\",\"America/Chicago\",\"5:12 PM\",-18000,\"1445379120\"],[null,null,30.248592,-97.736886],null,\"0x8644b4540e1b273d:0x5735e5c1f1cf1511\",null,null,null,0],[\"Riverside/Summit\",\"999\",[\"1445379232\",\"America/Chicago\",\"5:13
  PM\",-18000,\"1445379180\"],[\"1445379232\",\"America/Chicago\",\"5:13 PM\",-18000,\"1445379180\"],[null,null,30.245976,-97.731836],null,\"0x8644b451c4354b05:0x67b55787a4820e74\",null,null,null,0],[\"1805
  Riverside/Parker\",\"5554\",[\"1445379307\",\"America/Chicago\",\"5:15 PM\",-18000,\"1445379300\"],[\"1445379307\",\"America/Chicago\",\"5:15
  PM\",-18000,\"1445379300\"],[null,null,30.242658,-97.729061],null,\"0x8644b44f8eb2c1e1:0x5289e05197242222\",null,null,null,0],[\"Riverside/Burton\",\"1002\",[\"1445379360\",\"America/Chicago\",\"5:16
  PM\",-18000,\"1445379360\"],[\"1445379360\",\"America/Chicago\",\"5:16 PM\",-18000,\"1445379360\"],[null,null,30.240343,-97.72730899999999],null,\"0x8644b445ba86499d:0x94fda4df4d8a5c17\",null,null,null,0],[\"1724
  Burton/Woodland\",\"1190\",[\"1445379463\",\"America/Chicago\",\"5:17 PM\",-18000,\"1445379420\"],[\"1445379463\",\"America/Chicago\",\"5:17
  PM\",-18000,\"1445379420\"],[null,null,30.23615,-97.72846],null,\"0x8644b4437be76c15:0x8dd6fbec5461e336\",null,null,null,0],[\"1920
  Burton/Mariposa\",\"1191\",[\"1445379545\",\"America/Chicago\",\"5:19 PM\",-18000,\"1445379540\"],[\"1445379545\",\"America/Chicago\",\"5:19
  PM\",-18000,\"1445379540\"],[null,null,30.23386,-97.73181],null,\"0x8644b45cd95397f5:0x68ea05a7424a8d6e\",null,null,null,0],[\"2200
  Burton/Oltorf\",\"3535\",[\"1445379612\",\"America/Chicago\",\"5:20 PM\",-18000,\"1445379600\"],[\"1445379612\",\"America/Chicago\",\"5:20
  PM\",-18000,\"1445379600\"],[null,null,30.231271,-97.733733],null,\"0x8644b45d82a38c4d:0xd851f1f71d95436f\",null,null,null,0],[\"2310
  Parker/Oltorf\",\"1193\",[\"1445379701\",\"America/Chicago\",\"5:21 PM\",-18000,\"1445379660\"],[\"1445379701\",\"America/Chicago\",\"5:21
  PM\",-18000,\"1445379660\"],[null,null,30.23187,-97.73729],null,\"0x8644b45e6b671df3:0x237b166cc3380a1c\",null,null,null,0],[\"2504
  Parker/Braxton\",\"1194\",[\"1445379749\",\"America/Chicago\",\"5:22 PM\",-18000,\"1445379720\"],[\"1445379749\",\"America/Chicago\",\"5:22
  PM\",-18000,\"1445379720\"],[null,null,30.229929,-97.738557],null,\"0x8644b46083f1351b:0x4d4d847f1e171d34\",null,null,null,0],[\"2718
  Parker/Royal Hill\",\"1195\",[\"1445379813\",\"America/Chicago\",\"5:23 PM\",-18000,\"1445379780\"],[\"1445379813\",\"America/Chicago\",\"5:23
  PM\",-18000,\"1445379780\"],[null,null,30.227504,-97.740505],null,\"0x8644b4603451fa4d:0xc01a031d0d824477\",null,null,null,0],[\"3004
  Parker/Timber Ridge\",\"4325\",[\"1445379877\",\"America/Chicago\",\"5:24 PM\",-18000,\"1445379840\"],[\"1445379877\",\"America/Chicago\",\"5:24
  PM\",-18000,\"1445379840\"],[null,null,30.224895,-97.742138],null,\"0x8644b48a05afde23:0x3393e3cd7c055351\",null,null,null,0],[\"3300
  Parker/Timber Ridge\",\"4323\",[\"1445379937\",\"America/Chicago\",\"5:25 PM\",-18000,\"1445379900\"],[\"1445379937\",\"America/Chicago\",\"5:25
  PM\",-18000,\"1445379900\"],[null,null,30.22216,-97.742228],null,\"0x8644b489d077dce1:0x86b6a15f5b185761\",null,null,null,0],[\"Woodward/Parker
  SW Corner\",\"2169\",[\"1445380020\",\"America/Chicago\",\"5:27 PM\",-18000,\"1445380020\"],[\"1445380020\",\"America/Chicago\",\"5:27
  PM\",-18000,\"1445380020\"],[null,null,30.219261,-97.74391199999999],null,\"0x8644b48864db6491:0x25a5f73b38ad9d82\",null,null,null,0],[\"Woodward/Ben
  White NW Corner\",\"1199\",[\"1445380060\",\"America/Chicago\",\"5:27 PM\",-18000,\"1445380020\"],[\"1445380060\",\"America/Chicago\",\"5:27
  PM\",-18000,\"1445380020\"],[null,null,30.21715,-97.74404],null,\"0x8644b487c98a1859:0xf77faabf8a46110a\",null,null,null,0],[\"Woodward/Ben
  White SW Corner\",\"4318\",[\"1445380109\",\"America/Chicago\",\"5:28 PM\",-18000,\"1445380080\"],[\"1445380109\",\"America/Chicago\",\"5:28
  PM\",-18000,\"1445380080\"],[null,null,30.21464,-97.74469999999999],null,\"0x8644b486e3846989:0xb0761984cdb7061f\",null,null,null,0],[\"4120
  Freidrich/Woodward\",\"4317\",[\"1445380145\",\"America/Chicago\",\"5:29 PM\",-18000,\"1445380140\"],[\"1445380145\",\"America/Chicago\",\"5:29
  PM\",-18000,\"1445380140\"],[null,null,30.213561,-97.74585499999999],null,\"0x8644b486b8f199db:0x220464b14173d0aa\",null,null,null,0],[\"Freidrich/Directors\",\"1202\",[\"1445380198\",\"America/Chicago\",\"5:29
  PM\",-18000,\"1445380140\"],[\"1445380198\",\"America/Chicago\",\"5:29 PM\",-18000,\"1445380140\"],[null,null,30.21249,-97.74821],null,\"0x8644b4840a7545a3:0xd1524cfb80d62b29\",null,null,null,0],[\"4216
  Freidrich/St Elmo\",\"5917\",[\"1445380223\",\"America/Chicago\",\"5:30 PM\",-18000,\"1445380200\"],[\"1445380223\",\"America/Chicago\",\"5:30
  PM\",-18000,\"1445380200\"],[null,null,30.211274,-97.748981],null,\"0x8644b48394723013:0x99d7031b410e5e51\",null,null,null,0]],[[[null,null,\"a\",[1.25,\"$1.25\",\"USD\"]]],1,0]],null,null,null,[[[2614.437784465554,-97.716081,30.32833899999999],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.32834503635147,-97.71618502177768],[null,null,30.328339,-97.716081]],[null,null,30.328339,-97.716081],null,[[183.8274343003257,-97.71799320573341,30.3284499646461],[93.84623718261719,45,0],[1024,768],60]],[1.25,\"$1.25\",\"USD\"],[[4,null,[3,\"bus.png\",null,\"Bus\",[[\"https://maps.gstatic.com/mapfiles/transit/iw2/b/bus.png\",0,[15,15],null,0]]]],[5,[\"7\",1,\"#e11f8f\",\"#000000\"]],[7,[\"towards
  7-Duval / Dove Springs-SB\"]]]],null,[[\"6402 Airport Blvd (Highland Mall)\",\"5603\",null,[\"1445376428\",\"America/Chicago\",\"4:27
  PM\",-18000,\"1445376420\"],[null,null,30.328339,-97.716081],null,\"0x8644ca3ec8832725:0xc51abc688ea6b523\",null,null,null,0],[\"4600
  Freidrich/St Elmo\",\"1203\",[\"1445380288\",\"America/Chicago\",\"5:31 PM\",-18000,\"1445380260\"],null,[null,null,30.20818,-97.75090999999999],null,\"0x8644b482eb738e89:0xf8056593f87dc187\",null,null,null,0],52,\"#e11f8f\",0,null,2,[[\"5789
  Airport/Koenig\",\"5625\",[\"1445376579\",\"America/Chicago\",\"4:29 PM\",-18000,\"1445376540\"],[\"1445376579\",\"America/Chicago\",\"4:29
  PM\",-18000,\"1445376540\"],[null,null,30.321647,-97.71395],null,\"0x8644ca167189d9bd:0xcfa72d6020fe8be2\",null,null,null,0],[\"5600
  Avenue F/56th\",\"1164\",[\"1445376720\",\"America/Chicago\",\"4:32 PM\",-18000,\"1445376720\"],[\"1445376720\",\"America/Chicago\",\"4:32
  PM\",-18000,\"1445376720\"],[null,null,30.32117,-97.71899999999999],null,\"0x8644ca153b75ecb1:0xb81cac8814aefaff\",null,null,null,0],[\"5500
  Avenue F/55th\",\"1165\",[\"1445376749\",\"America/Chicago\",\"4:32 PM\",-18000,\"1445376720\"],[\"1445376749\",\"America/Chicago\",\"4:32
  PM\",-18000,\"1445376720\"],[null,null,30.31993,-97.71978999999999],null,\"0x8644ca14d4891fa9:0xb8eb8522cfadf62c\",null,null,null,0],[\"303
  53RD/Avenue G\",\"1167\",[\"1445376825\",\"America/Chicago\",\"4:33 PM\",-18000,\"1445376780\"],[\"1445376825\",\"America/Chicago\",\"4:33
  PM\",-18000,\"1445376780\"],[null,null,30.317091,-97.720114],null,\"0x8644ca6cab0a7419:0x5cb44286f1e7c5a1\",null,null,null,0],[\"Duval/51ST\",\"1168\",[\"1445376906\",\"America/Chicago\",\"4:35
  PM\",-18000,\"1445376900\"],[\"1445376906\",\"America/Chicago\",\"4:35 PM\",-18000,\"1445376900\"],[null,null,30.314362,-97.719922],null,\"0x8644ca12d5318da9:0xc41141a40dd2caec\",null,null,null,0],[\"Duval/48th\",\"1169\",[\"1445376988\",\"America/Chicago\",\"4:36
  PM\",-18000,\"1445376960\"],[\"1445376988\",\"America/Chicago\",\"4:36 PM\",-18000,\"1445376960\"],[null,null,30.31097,-97.72212999999999],null,\"0x8644ca7284fdd4ab:0xcfce14e783c21f7f\",null,null,null,0],[\"4510
  Duval/45th\",\"4150\",[\"1445377080\",\"America/Chicago\",\"4:38 PM\",-18000,\"1445377080\"],[\"1445377080\",\"America/Chicago\",\"4:38
  PM\",-18000,\"1445377080\"],[null,null,30.307337,-97.724462],null,\"0x8644ca73c38dfcd3:0x3c7b39e6ce1fe5b9\",null,null,null,0],[\"Duval/43RD\",\"1171\",[\"1445377161\",\"America/Chicago\",\"4:39
  PM\",-18000,\"1445377140\"],[\"1445377161\",\"America/Chicago\",\"4:39 PM\",-18000,\"1445377140\"],[null,null,30.30438,-97.72635699999999],null,\"0x8644ca76bc1a9ea9:0x3efd215b542f7b90\",null,null,null,0],[\"4002
  Duval/41ST\",\"1172\",[\"1445377235\",\"America/Chicago\",\"4:40 PM\",-18000,\"1445377200\"],[\"1445377235\",\"America/Chicago\",\"4:40
  PM\",-18000,\"1445377200\"],[null,null,30.301674,-97.728038],null,\"0x8644ca764d2680ed:0x1cccde210ec2dfa7\",null,null,null,0],[\"3508
  Duval/38th\",\"4152\",[\"1445377331\",\"America/Chicago\",\"4:42 PM\",-18000,\"1445377320\"],[\"1445377331\",\"America/Chicago\",\"4:42
  PM\",-18000,\"1445377320\"],[null,null,30.298182,-97.730215],null,\"0x8644b5880d389861:0x388c89b908f02ec8\",null,null,null,0],[\"Duval/33RD\",\"1174\",[\"1445377401\",\"America/Chicago\",\"4:43
  PM\",-18000,\"1445377380\"],[\"1445377401\",\"America/Chicago\",\"4:43 PM\",-18000,\"1445377380\"],[null,null,30.295649,-97.731832],null,\"0x8644b5863bd667b9:0x6b4530f0032f8934\",null,null,null,0],[\"3200
  Duval/32ND\",\"1175\",[\"1445377429\",\"America/Chicago\",\"4:43 PM\",-18000,\"1445377380\"],[\"1445377429\",\"America/Chicago\",\"4:43
  PM\",-18000,\"1445377380\"],[null,null,30.294603,-97.732495],null,\"0x8644b5866c2a2e7f:0x1cefc0f75a25975\",null,null,null,0],[\"Duval/30th\",\"1176\",[\"1445377504\",\"America/Chicago\",\"4:45
  PM\",-18000,\"1445377500\"],[\"1445377504\",\"America/Chicago\",\"4:45 PM\",-18000,\"1445377500\"],[null,null,30.291876,-97.734222],null,\"0x8644b58446221e3b:0x5f85d6750d6e9f4b\",null,null,null,0],[\"San
  Jacinto/Dean Keeton NW Corner\",\"1177\",[\"1445377563\",\"America/Chicago\",\"4:46
  PM\",-18000,\"1445377560\"],[\"1445377563\",\"America/Chicago\",\"4:46 PM\",-18000,\"1445377560\"],[null,null,30.289599,-97.734686],null,\"0x8644b584eb86b96d:0x9a0a53fa5d910dca\",null,null,null,0],[\"2400
  San Jacinto/24th\",\"1178\",[\"1445377625\",\"America/Chicago\",\"4:47 PM\",-18000,\"1445377620\"],[\"1445377625\",\"America/Chicago\",\"4:47
  PM\",-18000,\"1445377620\"],[null,null,30.28725,-97.73366],null,\"0x8644b59b28677297:0xf55a4f42d1757f4e\",null,null,null,0],[\"2300
  San Jacinto/23RD\",\"1179\",[\"1445377668\",\"America/Chicago\",\"4:47 PM\",-18000,\"1445377620\"],[\"1445377668\",\"America/Chicago\",\"4:47
  PM\",-18000,\"1445377620\"],[null,null,30.2855,-97.73378],null,\"0x8644b59afe03f837:0xb5b5e26b78bdb6f7\",null,null,null,0],[\"2100
  San Jacinto/21ST\",\"1180\",[\"1445377720\",\"America/Chicago\",\"4:48 PM\",-18000,\"1445377680\"],[\"1445377720\",\"America/Chicago\",\"4:48
  PM\",-18000,\"1445377680\"],[null,null,30.28336,-97.73416999999999],null,\"0x8644b59bc8866873:0x34cc5f7257129b40\",null,null,null,0],[\"1960
  San Jacinto/Trinity\",\"1181\",[\"1445377794\",\"America/Chicago\",\"4:49 PM\",-18000,\"1445377740\"],[\"1445377794\",\"America/Chicago\",\"4:49
  PM\",-18000,\"1445377740\"],[null,null,30.28066,-97.73389999999999],null,\"0x8644b5990c3b28fd:0x7afce830f0a5c2bd\",null,null,null,0],[\"1806
  San Jacinto/Martin Luther King\",\"915\",[\"1445377849\",\"America/Chicago\",\"4:50
  PM\",-18000,\"1445377800\"],[\"1445377849\",\"America/Chicago\",\"4:50 PM\",-18000,\"1445377800\"],[null,null,30.279508,-97.736019],null,\"0x8644b5992c77d977:0xefb47f790bd1c9ce\",null,null,null,0],[\"San
  Jacinto/17th\",\"916\",[\"1445377882\",\"America/Chicago\",\"4:51 PM\",-18000,\"1445377860\"],[\"1445377882\",\"America/Chicago\",\"4:51
  PM\",-18000,\"1445377860\"],[null,null,30.27816,-97.73649999999999],null,\"0x8644b59f33c71d1d:0x227c4c53f2b1ec25\",null,null,null,0],[\"San
  Jacinto/15th\",\"918\",[\"1445377926\",\"America/Chicago\",\"4:52 PM\",-18000,\"1445377920\"],[\"1445377926\",\"America/Chicago\",\"4:52
  PM\",-18000,\"1445377920\"],[null,null,30.27641,-97.73718],null,\"0x8644b59f578a9fb7:0xd278bab8817994ed\",null,null,null,0],[\"San
  Jacinto/14th\",\"919\",[\"1445377950\",\"America/Chicago\",\"4:52 PM\",-18000,\"1445377920\"],[\"1445377950\",\"America/Chicago\",\"4:52
  PM\",-18000,\"1445377920\"],[null,null,30.275451,-97.737526],null,\"0x8644b5a1e80c6e77:0x9fd972b53934176f\",null,null,null,0],[\"San
  Jacinto/13th\",\"920\",[\"1445377974\",\"America/Chicago\",\"4:52 PM\",-18000,\"1445377920\"],[\"1445377974\",\"America/Chicago\",\"4:52
  PM\",-18000,\"1445377920\"],[null,null,30.2745,-97.73786],null,\"0x8644b5a1bec3cc9d:0xff58a3423fbc15a6\",null,null,null,0],[\"San
  Jacinto/12th\",\"921\",[\"1445378002\",\"America/Chicago\",\"4:53 PM\",-18000,\"1445377980\"],[\"1445378002\",\"America/Chicago\",\"4:53
  PM\",-18000,\"1445377980\"],[null,null,30.27339,-97.73827999999999],null,\"0x8644b5a1a8759783:0xe9b1af6d4b8135a3\",null,null,null,0],[\"San
  Jacinto/11th\",\"922\",[\"1445378040\",\"America/Chicago\",\"4:54 PM\",-18000,\"1445378040\"],[\"1445378040\",\"America/Chicago\",\"4:54
  PM\",-18000,\"1445378040\"],[null,null,30.27221,-97.73872],null,\"0x8644b5a119136f7d:0x9a35fcb04ce9a36d\",null,null,null,0],[\"Guadalupe/8th\",\"5950\",[\"1445378324\",\"America/Chicago\",\"4:58
  PM\",-18000,\"1445378280\"],[\"1445378324\",\"America/Chicago\",\"4:58 PM\",-18000,\"1445378280\"],[null,null,30.271503,-97.74547799999999],null,\"0x8644b50bbf40f953:0x30bb6deac85e0f65\",null,null,null,0],[\"Guadalupe/4th\",\"2613\",[\"1445378483\",\"America/Chicago\",\"5:01
  PM\",-18000,\"1445378460\"],[\"1445378483\",\"America/Chicago\",\"5:01 PM\",-18000,\"1445378460\"],[null,null,30.26733,-97.74704],null,\"0x8644b5092b43859b:0xe33cd1c6a63c2ad\",null,null,null,0],[\"Auditorium
  Shores Station (SB)\",\"2763\",[\"1445378813\",\"America/Chicago\",\"5:06 PM\",-18000,\"1445378760\"],[\"1445378813\",\"America/Chicago\",\"5:06
  PM\",-18000,\"1445378760\"],[null,null,30.258767,-97.7487],null,\"0x8644b50473943fbd:0x15281c44b9c8d148\",null,null,null,0],[\"Riverside/Congress
  FS\",\"3846\",[\"1445378940\",\"America/Chicago\",\"5:09 PM\",-18000,\"1445378940\"],[\"1445378940\",\"America/Chicago\",\"5:09
  PM\",-18000,\"1445378940\"],[null,null,30.2562,-97.74602],null,\"0x8644b50172312a59:0xb3277b1f1bd67dcf\",null,null,null,0],[\"205
  Riverside/Congress\",\"3847\",[\"1445378970\",\"America/Chicago\",\"5:09 PM\",-18000,\"1445378940\"],[\"1445378970\",\"America/Chicago\",\"5:09
  PM\",-18000,\"1445378940\"],[null,null,30.254846,-97.744793],null,\"0x8644b501b199e399:0x217c3a29018eeb0\",null,null,null,0],[\"325
  Riverside/Newning\",\"5023\",[\"1445378995\",\"America/Chicago\",\"5:09 PM\",-18000,\"1445378940\"],[\"1445378995\",\"America/Chicago\",\"5:09
  PM\",-18000,\"1445378940\"],[null,null,30.25359,-97.743972],null,\"0x8644b50031e21013:0xb7367e2f3fadcffb\",null,null,null,0],[\"715
  Riverside/Alameda\",\"1186\",[\"1445379068\",\"America/Chicago\",\"5:11 PM\",-18000,\"1445379060\"],[\"1445379068\",\"America/Chicago\",\"5:11
  PM\",-18000,\"1445379060\"],[null,null,30.25073,-97.74060999999999],null,\"0x8644b45573d27435:0x77213f76cb9fdc5f\",null,null,null,0],[\"1005
  East Riverside/Travis Heights\",\"1187\",[\"1445379108\",\"America/Chicago\",\"5:11
  PM\",-18000,\"1445379060\"],[\"1445379108\",\"America/Chicago\",\"5:11 PM\",-18000,\"1445379060\"],[null,null,30.24959,-97.73835],null,\"0x8644b4544fe6361d:0x71572d34c74f16fd\",null,null,null,0],[\"Riverside/Kenwood\",\"1188\",[\"1445379137\",\"America/Chicago\",\"5:12
  PM\",-18000,\"1445379120\"],[\"1445379137\",\"America/Chicago\",\"5:12 PM\",-18000,\"1445379120\"],[null,null,30.248592,-97.736886],null,\"0x8644b4540e1b273d:0x5735e5c1f1cf1511\",null,null,null,0],[\"Riverside/Summit\",\"999\",[\"1445379232\",\"America/Chicago\",\"5:13
  PM\",-18000,\"1445379180\"],[\"1445379232\",\"America/Chicago\",\"5:13 PM\",-18000,\"1445379180\"],[null,null,30.245976,-97.731836],null,\"0x8644b451c4354b05:0x67b55787a4820e74\",null,null,null,0],[\"1805
  Riverside/Parker\",\"5554\",[\"1445379307\",\"America/Chicago\",\"5:15 PM\",-18000,\"1445379300\"],[\"1445379307\",\"America/Chicago\",\"5:15
  PM\",-18000,\"1445379300\"],[null,null,30.242658,-97.729061],null,\"0x8644b44f8eb2c1e1:0x5289e05197242222\",null,null,null,0],[\"Riverside/Burton\",\"1002\",[\"1445379360\",\"America/Chicago\",\"5:16
  PM\",-18000,\"1445379360\"],[\"1445379360\",\"America/Chicago\",\"5:16 PM\",-18000,\"1445379360\"],[null,null,30.240343,-97.72730899999999],null,\"0x8644b445ba86499d:0x94fda4df4d8a5c17\",null,null,null,0],[\"1724
  Burton/Woodland\",\"1190\",[\"1445379463\",\"America/Chicago\",\"5:17 PM\",-18000,\"1445379420\"],[\"1445379463\",\"America/Chicago\",\"5:17
  PM\",-18000,\"1445379420\"],[null,null,30.23615,-97.72846],null,\"0x8644b4437be76c15:0x8dd6fbec5461e336\",null,null,null,0],[\"1920
  Burton/Mariposa\",\"1191\",[\"1445379545\",\"America/Chicago\",\"5:19 PM\",-18000,\"1445379540\"],[\"1445379545\",\"America/Chicago\",\"5:19
  PM\",-18000,\"1445379540\"],[null,null,30.23386,-97.73181],null,\"0x8644b45cd95397f5:0x68ea05a7424a8d6e\",null,null,null,0],[\"2200
  Burton/Oltorf\",\"3535\",[\"1445379612\",\"America/Chicago\",\"5:20 PM\",-18000,\"1445379600\"],[\"1445379612\",\"America/Chicago\",\"5:20
  PM\",-18000,\"1445379600\"],[null,null,30.231271,-97.733733],null,\"0x8644b45d82a38c4d:0xd851f1f71d95436f\",null,null,null,0],[\"2310
  Parker/Oltorf\",\"1193\",[\"1445379701\",\"America/Chicago\",\"5:21 PM\",-18000,\"1445379660\"],[\"1445379701\",\"America/Chicago\",\"5:21
  PM\",-18000,\"1445379660\"],[null,null,30.23187,-97.73729],null,\"0x8644b45e6b671df3:0x237b166cc3380a1c\",null,null,null,0],[\"2504
  Parker/Braxton\",\"1194\",[\"1445379749\",\"America/Chicago\",\"5:22 PM\",-18000,\"1445379720\"],[\"1445379749\",\"America/Chicago\",\"5:22
  PM\",-18000,\"1445379720\"],[null,null,30.229929,-97.738557],null,\"0x8644b46083f1351b:0x4d4d847f1e171d34\",null,null,null,0],[\"2718
  Parker/Royal Hill\",\"1195\",[\"1445379813\",\"America/Chicago\",\"5:23 PM\",-18000,\"1445379780\"],[\"1445379813\",\"America/Chicago\",\"5:23
  PM\",-18000,\"1445379780\"],[null,null,30.227504,-97.740505],null,\"0x8644b4603451fa4d:0xc01a031d0d824477\",null,null,null,0],[\"3004
  Parker/Timber Ridge\",\"4325\",[\"1445379877\",\"America/Chicago\",\"5:24 PM\",-18000,\"1445379840\"],[\"1445379877\",\"America/Chicago\",\"5:24
  PM\",-18000,\"1445379840\"],[null,null,30.224895,-97.742138],null,\"0x8644b48a05afde23:0x3393e3cd7c055351\",null,null,null,0],[\"3300
  Parker/Timber Ridge\",\"4323\",[\"1445379937\",\"America/Chicago\",\"5:25 PM\",-18000,\"1445379900\"],[\"1445379937\",\"America/Chicago\",\"5:25
  PM\",-18000,\"1445379900\"],[null,null,30.22216,-97.742228],null,\"0x8644b489d077dce1:0x86b6a15f5b185761\",null,null,null,0],[\"Woodward/Parker
  SW Corner\",\"2169\",[\"1445380020\",\"America/Chicago\",\"5:27 PM\",-18000,\"1445380020\"],[\"1445380020\",\"America/Chicago\",\"5:27
  PM\",-18000,\"1445380020\"],[null,null,30.219261,-97.74391199999999],null,\"0x8644b48864db6491:0x25a5f73b38ad9d82\",null,null,null,0],[\"Woodward/Ben
  White NW Corner\",\"1199\",[\"1445380060\",\"America/Chicago\",\"5:27 PM\",-18000,\"1445380020\"],[\"1445380060\",\"America/Chicago\",\"5:27
  PM\",-18000,\"1445380020\"],[null,null,30.21715,-97.74404],null,\"0x8644b487c98a1859:0xf77faabf8a46110a\",null,null,null,0],[\"Woodward/Ben
  White SW Corner\",\"4318\",[\"1445380109\",\"America/Chicago\",\"5:28 PM\",-18000,\"1445380080\"],[\"1445380109\",\"America/Chicago\",\"5:28
  PM\",-18000,\"1445380080\"],[null,null,30.21464,-97.74469999999999],null,\"0x8644b486e3846989:0xb0761984cdb7061f\",null,null,null,0],[\"4120
  Freidrich/Woodward\",\"4317\",[\"1445380145\",\"America/Chicago\",\"5:29 PM\",-18000,\"1445380140\"],[\"1445380145\",\"America/Chicago\",\"5:29
  PM\",-18000,\"1445380140\"],[null,null,30.213561,-97.74585499999999],null,\"0x8644b486b8f199db:0x220464b14173d0aa\",null,null,null,0],[\"Freidrich/Directors\",\"1202\",[\"1445380198\",\"America/Chicago\",\"5:29
  PM\",-18000,\"1445380140\"],[\"1445380198\",\"America/Chicago\",\"5:29 PM\",-18000,\"1445380140\"],[null,null,30.21249,-97.74821],null,\"0x8644b4840a7545a3:0xd1524cfb80d62b29\",null,null,null,0],[\"4216
  Freidrich/St Elmo\",\"5917\",[\"1445380223\",\"America/Chicago\",\"5:30 PM\",-18000,\"1445380200\"],[\"1445380223\",\"America/Chicago\",\"5:30
  PM\",-18000,\"1445380200\"],[null,null,30.211274,-97.748981],null,\"0x8644b48394723013:0x99d7031b410e5e51\",null,null,null,0]],[[[null,null,\"a\",[1.25,\"$1.25\",\"USD\"]]],1,0],null,0,0,[[[[[4,null,[3,\"bus.png\",null,\"Bus\",[[\"https://maps.gstatic.com/mapfiles/transit/iw2/b/bus.png\",0,[15,15],null,0]]]],[5,[\"7\",1,\"#e11f8f\",\"#000000\"]],[7,[\"towards
  7-Duval / Dove Springs-SB\"]]],[[\"Capital Metro\",\"3508131340849202367\",null,null,\"1
  512-474-1200\",null,null,[\"/url?q=http://www.capmetro.org/\\u0026sa=U\\u0026ved=0CGwQvUwoAjAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNEz-vxk9RiqqKpmZkHhN0Z-I0xxbw\",null,null,\"0CGwQvUwoAjAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],[\"/url?q=http://www.capmetro.org/fares/\\u0026sa=U\\u0026ved=0CG0QkFwoAzAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNFQ1tWq_-9Vs8f5n7JQTGE2f-FYag\",\"Ticket
  information\",null,\"0CG0QkFwoAzAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"]]],\"#e11f8f\",\"7-Duval
  / Dove Springs-SB\"],[3860,\"1 h 4 min\",3840],0,52,[3860,\"1 h 4 min\",3840]]],null,\"BChIJj3BuQrG1RIYRB5mdrhYzFVkQqNuasQU=\",null,[0],[3860,\"1
  h 4 min\",3840],\"ChIJJSeDyD7KRIYRI7Wmjmi8GsUSEgmJjnPrgrREhhGHwX34k2UF-Bis45qxBSACMgx1cy10eC1hdXN0aW44lB4=\"]],[[null,[392,\"0.2
  mi\",1],[276,\"5 min\",300],2,null,[],null,null,null,[[[989.3443853324784,-97.74945724999999,30.2073526],[0,0,0],[1024,768],13.10000038146973]],null,[[1,null,[3,\"walk.png\",null,\"Walk\",[[\"https://maps.gstatic.com/mapfiles/transit/iw2/b/walk.png\",0,[15,15],null,0]]]],[2,[\"Walk\"]]]],[[[\"\",[37,\"121
  ft\",1],[27,\"27 s\"],2,null,null,null,null,null,[[[2614.43778446428,-97.75090999999999,30.20818],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.20815308042317,-97.75081937544159],[null,null,30.20818,-97.75090999999999]],[null,null,30.20818,-97.75090999999999],null,[[183.8274343002361,-97.7490997714509,30.20764227916735],[-71.03105926513672,45,0],[1024,768],60]],null,[[2,[\"Head
  \"]],[2,[\"southwest\",1]],[2,[\" on \"]],[2,[\"Freidrich Ln\",1]],[2,[\" toward
  \"]],[2,[\"Sponberg Dr\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],534,0],0]]]],[[\"\",[302,\"0.2
  mi\",1],[212,\"4 min\"],2,null,null,null,null,null,[[[2614.437784468795,-97.7510334,30.2078567],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.20801421110194,-97.75093264238593],[null,null,30.2078567,-97.7510334]],[null,null,30.2078567,-97.7510334],null,[[183.8274343005536,-97.75010730020625,30.2093044322054],[-151.0653228759766,45,0],[1024,768],60],[\"OJX2BxwVREsamv6NAmoTYg\",0,1,null,null,515.4652099609375,[\"//geo0.ggpht.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=thumbnail\\u0026thumb=2\\u0026panoid=OJX2BxwVREsamv6NAmoTYg\\u0026w=203\\u0026h=100\\u0026yaw=212\\u0026pitch=0\\u0026thumbfov=114\\u0026ll=30.208028,-97.750924\",\"\",null,[203,100]],null,[[3,-97.75092388002835,30.2080278672752],[212.6128082275391,90],[1024,768],75],\"Iz4lVpDJCYfImAXc74XYCw\",\"0CHEQ9FQoADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\",[\"/url?q=http://www.google.com/cbk%3Fcb_client%3Dmaps_sv.lite_desktop%26output%3Dreport%26panoid%3DOJX2BxwVREsamv6NAmoTYg\\u0026sa=U\\u0026ved=0CHIQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\\u0026usg=AFQjCNExn8S9JV-gid3ZNmvgpsSAINdlAQ\",null,null,\"0CHIQ-y4oADAAahUKEwjQ5o-7nM_IAhUHJKYKHdx3Abs\"],null,null,null,null,null,null,null,null,null,[null,[2,\"OJX2BxwVREsamv6NAmoTYg\"],[2,2,null,[]],null,null,[[[2],[[null,null,30.2080278672752,-97.75092388002835]]]],[3,null,null,null,null,[null,null,\"launch\",[6]]],[\"//www.google.com/cbk?cb_client=maps_sv.lite_desktop\\u0026output=report\\u0026panoid=OJX2BxwVREsamv6NAmoTYg\"]],2]],null,[[2,[\"Turn
  \"]],[14,[\"left\",1]],[2,[\" at \"]],[2,[\"Sponberg Dr\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],413,0],0]]]],[[\"\",[18,\"59
  ft\",1],[13,\"13 s\"],2,null,null,null,null,null,[[[2614.437784461822,-97.7482873,30.2065332],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.2066211616429,-97.74846898856201],[null,null,30.2065332,-97.7482873]],[null,null,30.2065332,-97.7482873],null,[[183.8274343000633,-97.74995726175909,30.20734168260655],[119.2575378417969,45,0],[1024,768],60]],null,[[2,[\"Turn
  \"]],[14,[\"left\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],413,0],0]]]],[[\"\\u003cstep
  maneuver='TURN' meters='35'\\u003eTurn \\u003cturn side='RIGHT'\\u003eright\\u003c/turn\\u003e\\u003c/step\\u003e\",[35,\"115
  ft\",1],[24,\"24 s\"],2,null,null,null,null,[[null,\"Destination will be on the
  left\",null,null,null,null,null,null,8,null,null,null,null,null,null,1]],[[[2614.437784454084,-97.74819540000001,30.2066761],[0,0,0],[1024,768],13.10000038146973],[[null,null,30.2065332,-97.7482873],[null,null,30.2066761,-97.7481954]],[null,null,30.2066761,-97.7481954],null,[[183.8274342995192,-97.74912528484799,30.20523016502267],[29.06460189819336,45,0],[1024,768],60]],null,[[2,[\"Turn
  \"]],[14,[\"right\",1]]]],[2,null,null,null,[[\"https://maps.gstatic.com/tactile/directions/text_mode/maneuvers-2x.png\",0,[16,16],[[19,630],483,0],0]]]]]]]]],null,[336,\"6
  min\",360]]],0,[[[[\"3700 North Capital of Texas Highway, Austin, TX 78746, USA\",\"0x865b3521d926d8e1:0x1bfb7968d96b2db4\",[null,null,30.336973,-97.806704],\"3700
  N Capital of Texas Hwy, Austin, TX 78746\",null,0],[[\"3700 N Capital of Texas Hwy\",\"Austin,
  TX 78746\"],null,\"3700 N Capital of Texas Hwy, Austin, TX 78746\",\"3700 N Capital
  of Texas Hwy\"],null,null,null,null,null,1,[\"3700 N Capital of Texas Hwy\",null,null,null,null,null,null,null,null,null,null,\"Ag4VEqDhs8W0LWvZaHn7G-HYJtkhNVuG\"],[\"0x865b3521d926d8e1:0x1bfb7968d96b2db4\",\"3700
  N Capital of Texas Hwy, Austin, TX 78746\",null,[null,null,30.336973,-97.806704],0,1]],null,0,\"BCjAKHQoSCSGk-L8hNVuGEbJ-H8szHRqYEQAAAKDbkuY_EgoN-foUEhU2CLTFKgMQoQIQCQ==\",\"3700
  North Capital of Texas Highway, Austin, TX 78746, USA\"],[[[\"Austin Rock Gym, Freidrich
  Lane #300, Austin, TX\",\"0x8644b48295c08aff:0x7425015bf20a2e5c\",[null,null,30.2067032,-97.7477667],\"Austin
  Rock Gym, 4401 Freidrich Lane #300, Austin, TX 78744\",null,0],[[\"Austin Rock Gym\",\"4401
  Freidrich Lane #300, Austin, TX 78744\"],\"Austin Rock Gym\",\"4401 Freidrich Lane
  #300, Austin, TX 78744\",\"4401 Freidrich Ln #300\"],null,null,null,null,null,1,[\"Austin
  Rock Gym\",null,null,null,null,null,null,null,null,null,null,\"WC0BEt3fvMVcLgryWwEldP-KwJWCtESG\"],[\"0x8644b48295c08aff:0x7425015bf20a2e5c\",\"Austin
  Rock Gym, 4401 Freidrich Lane #300, Austin, TX 78744\",null,[null,null,30.2067032,-97.7477667],0,1]],null,0,\"BChQSCg1YLQESFd3fvMU4ATgAOAI4AxDDGg==\",\"Austin
  Rock Gym, Freidrich Lane #300, Austin, TX\"]],null,[[null,null,[[0],[1],[2]]]],[[[0],0,[1320,\"22
  min\"]],[[3],0,[5640,\"1 hr 34\"]],[[2],0],[[1],0]]],null,null,null,null,null,\"https://www.google.com/maps/api/js?client=google-maps-lite\\u0026libraries=geometry,search\\u0026v=3.22.7\\u0026language=en-US\\u0026region=us\\u0026callback=v3loaded\\u0026module_domain_from_bootstrap=1\",\"https://www.google.com/maps-lite/js/2/23a/main.js\",0,\"Mechanize/2.7.3
  Ruby/2.1.2p95 (http://github.com/sparklemotion/mechanize/),gzip(gfe)\",null,null,1,0,0,\"https://www.google.com/maps/dir/3700+North+Capital+of+Texas+Highway,+Austin,+TX+78746,+USA/Austin+Rock+Gym,+Freidrich+Lane+%23300,+Austin,+TX/@30.2828494,-97.8404999,12z/data=!3m1!4b1!4m17!4m16!1m5!1m1!1s0x865b3521d926d8e1:0x1bfb7968d96b2db4!2m2!1d-97.806704!2d30.336973!1m5!1m1!1s0x8644b48295c08aff:0x7425015bf20a2e5c!2m2!1d-97.7477667!2d30.2067032!2m3!6e0!7e2!8j1445353200?dg=dbrw\\u0026newdg=1\",0,null,0,null,null,\"Iz4lVuLdBOOGrgOBs72gBA\",null,null,[\"dbrw\",1],null,null,null,null,0,null,null,null,[0,1,1,0,1,1,null,null,0,0,0,0,0,\"\",0,0],null,null,\"Iz4lVpDJCYfImAXc74XYCw\"]);\n
  \     };\n    </script>\n    <meta content=\"IE=edge,chrome=1\" http-equiv=\"X-UA-Compatible\">\n
  \   <title>Google Maps</title>\n    <meta name=\"viewport\" content=\"initial-scale=1.0,
  user-scalable=no\">\n    <meta name=\"referrer\" content=\"origin\">\n    <meta
  name=\"google\" content=\"notranslate\">\n    <meta property=\"og:title\" content=\"Google
  Maps\" itemprop=\"name\">\n    <meta property=\"og:site_name\" content=\"Google
  Maps\">\n    <meta name=\"twitter:card\" content=\"summary\">\n    <meta name=\"twitter:title\"
  content=\"Google Maps\">\n    <link href=\"//www.google.com/images/branding/product/ico/maps_32dp.ico\"
  rel=\"shortcut icon\">\n    <style>\n      html, body {\n        height: 100%;\n
  \       margin: 0;\n        padding: 0;\n      }\n      @font-face{font-family:'Roboto';font-style:normal;font-weight:300;src:local('Roboto
  Light'),local('Roboto-Light'),url(//fonts.gstatic.com/s/roboto/v15/Hgo13k-tfSpn0qi1SFdUfaCWcynf_cDxXwCLxiixG1c.ttf)format('truetype');}@font-face{font-family:'Roboto';font-style:normal;font-weight:400;src:local('Roboto
  Regular'),local('Roboto-Regular'),url(//fonts.gstatic.com/s/roboto/v15/zN7GBFwfMP4uA6AR0HCoLQ.ttf)format('truetype');}@font-face{font-family:'Roboto';font-style:normal;font-weight:500;src:local('Roboto
  Medium'),local('Roboto-Medium'),url(//fonts.gstatic.com/s/roboto/v15/RxZJdnzeo3R5zSexge8UUaCWcynf_cDxXwCLxiixG1c.ttf)format('truetype');}@font-face{font-family:'Roboto';font-style:normal;font-weight:700;src:local('Roboto
  Bold'),local('Roboto-Bold'),url(//fonts.gstatic.com/s/roboto/v15/d-6IYplOFocCacKzxwXSOKCWcynf_cDxXwCLxiixG1c.ttf)format('truetype');}@font-face{font-family:'Product
  Sans';font-style:normal;font-weight:400;src:local('Product Sans'),local('ProductSans-Regular'),url(//fonts.gstatic.com/s/productsans/v5/HYvgU2fE2nRJvZ5JFAumwYnF5uFdDttMLvmWuJdhhgs.ttf)format('truetype');}\n
  \   </style>\n  </head>\n  <body>\n    <script>\n      v3loaded = function() {\n
  \       mapslite.createApplication(document.body);\n      };\n    </script>\n    <script
  src=\"https://www.google.com/maps-lite/js/2/23a/main.js\"></script>\n    <script
  src=\"https://www.google.com/maps/api/js?client=google-maps-lite&amp;libraries=geometry,search&amp;v=3.22.7&amp;language=en-US&amp;region=us&amp;callback=v3loaded&amp;module_domain_from_bootstrap=1\"></script>\n
  \   <style>#gbar,#guser{font-size:13px;padding-top:0px !important;}#gbar{height:22px}#guser{padding-bottom:7px
  !important;text-align:right}.gbh,.gbd{border-top:1px solid #c9d7f1;font-size:1px}.gbh{height:0;position:absolute;top:24px;width:100%}@media
  all{.gb1{height:22px;margin-right:.5em;vertical-align:top}#gbar{float:left}}a.gb1,a.gb4{text-decoration:underline
  !important}a.gb1,a.gb4{color:#00c !important}.gbi .gb4{color:#dd8e27 !important}.gbf
  .gb4{color:#900 !important}\n</style>\n    <div class=\"ml-onegoogle\">\n      \n
  \   </div>\n    <script></script>\n    \n  </body>\n</html>\n"
code: '200'
full_path: false
response: !ruby/hash:Mechanize::Headers
  content-type: text/html; charset=UTF-8
  date: Mon, 19 Oct 2015 19:01:55 GMT
  pragma: no-cache
  expires: Fri, 01 Jan 1990 00:00:00 GMT
  cache-control: no-cache, must-revalidate
  vary: Accept-Language
  content-encoding: gzip
  server: mafe
  x-xss-protection: 1; mode=block
  x-frame-options: SAMEORIGIN
  alternate-protocol: 443:quic,p=1
  alt-svc: quic="www.google.com:443"; p="1"; ma=600,quic=":443"; p="1"; ma=600
  transfer-encoding: chunked
filename: data=!3m1!4b1!4m17!4m16!1m5!1m1!1s0x865b3521d926d8e1_0x1bfb7968d96b2db4!2m2!1d-97.806704!2d30.336973!1m5!1m1!1s0x8644b48295c08aff_0x7425015bf20a2e5c!2m2!1d-97.7477667!2d30.2067032!2m3!6e0!7e2!8j1445353200_dg=dbrw&newdg=1
=end