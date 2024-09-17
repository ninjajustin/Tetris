
MODULES=tetris environment main board
OBJECTS=$(MODULES:=.cmo)
MLS=$(MODULES:=.ml)
MLIS=$(MODULES:=.mli)
TEST=test.byte
MAIN=main.byte
TETRIS=tetris.byte
BOARD=board.byte
OCAMLBUILD=ocamlbuild -use-ocamlfind -package lablgl.glut -pkgs graphics -lib unix

default: build
	OCAMLRUNPARAM=b utop

build:
	$(OCAMLBUILD) $(OBJECTS) 

test:
	$(OCAMLBUILD) -tag 'debug' $(TEST) && ./$(TEST) -runner sequential

play:
	$(OCAMLBUILD) -tag 'debug' $(TETRIS) && OCAMLRUNPARAM=b ./$(TETRIS)

check:
	@bash check.sh
	
finalcheck:
	@bash check.sh final

zip:
	zip tetrisgame.zip *.ml* _tags .merlin .ocamlformat .ocamlinit Makefile	INSTALL.txt
	
docs: docs-public docs-private
	
docs-public: build
	mkdir -p _doc.public
	ocamlfind ocamldoc -I _build -package graphics \
		-html -stars -d _doc.public $(MLIS)

docs-private: build
	mkdir -p _doc.private
	ocamlfind ocamldoc -I _build -package graphics \
		-html -stars -d _doc.private \
		-inv-merge-ml-mli -m A $(MLIS) $(MLS)

clean:
	ocamlbuild -clean
	rm -rf _doc.public _doc.private tetrisgame.zip
