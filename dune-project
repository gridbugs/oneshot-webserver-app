(lang dune 3.13)

(pin
 (url "file://./oneshot_webserver")
 (package
  (name oneshot_webserver)
  (version 0.1)))
(package
 (name oneshot_webserver_app)
 (depends oneshot_webserver))
