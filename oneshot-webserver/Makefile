OCAMLFIND=ocamlfind
OCAMLC=ocamlc
OCAMLOPT=ocamlopt
OCAMLMKLIB=ocamlmklib

all: oneshot_webserver.cmxa oneshot_webserver.cmxs

%.cmi: %.mli
	$(OCAMLC) -c $<

%.cmx: %.ml %.cmi
	$(OCAMLFIND) ocamlopt -package unix -c $<

oneshot_webserver.cmxa: oneshot_webserver.cmx
	$(OCAMLMKLIB) -o oneshot_webserver $<

liboneshot_webserver.a: oneshot_webserver.a
	cp $< $@

oneshot_webserver.cmxs: oneshot_webserver.cmxa liboneshot_webserver.a
	$(OCAMLOPT) -shared -o $@ -I . oneshot_webserver.cmxa -linkall

install: META oneshot_webserver.a oneshot_webserver.cmi oneshot_webserver.cmx oneshot_webserver.cmxa oneshot_webserver.cmxs liboneshot_webserver.a
	$(OCAMLFIND) install oneshot_webserver $^

uninstall:
	$(OCAMLFIND) remove oneshot_webserver

clean:
	rm -f *.cmo *.cmi *.cmx *.cmxa *.cmxs *.o *.a
 
.PHONY: clean install
