(lang dune 3.13)

(pin
 (url "file://./oneshot-webserver")
 (package
  (name oneshot-webserver)
  (version 0.1)))
(package
 (name oneshot_webserver_app)
 (depends oneshot-webserver))
