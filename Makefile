REGISTRY?=OpenGL-Registry/xml/gl.xml
EXTENSIONS?=

GENERATOR?=dotnet run

all: \
		 exports/gl_1v1.zig \
		 exports/gl_1v2.zig \
		 exports/gl_1v3.zig \
		 exports/gl_1v4.zig \
		 exports/gl_1v5.zig \
		 exports/gl_2v0.zig \
		 exports/gl_2v1.zig \
		 exports/gl_3v0.zig \
		 exports/gl_3v1.zig \
		 exports/gl_3v2.zig \
		 exports/gl_3v3.zig \
     exports/gl_4v0.zig \
		 exports/gl_4v2.zig \
		 exports/gl_4v3.zig \
		 exports/gl_4v4.zig \
		 exports/gl_4v5.zig \
		 exports/gl_4v6.zig \
		 exports/gl_es_1v0.zig \
		 exports/gl_es_1v0.zig \
		 exports/gl_es_2v0.zig \
		 exports/gl_es_3v0.zig \
		 exports/gl_es_3v1.zig \
		 exports/gl_es_3v2.zig

exports/gl_%.zig: $(REGISTRY)
	$(GENERATOR) $(REGISTRY) $@ GL_VERSION_$(subst exports/gl_,,$(subst v,_,${@:.zig=})) $(EXTENSIONS)
	zig fmt $@
	zig test $@

exports/gl_es_1v0.zig: $(REGISTRY)
	$(GENERATOR) $(REGISTRY) $@ GL_VERSION_ES_CM_1_0 $(EXTENSIONS)
	zig fmt $@
	zig test $@

exports/gl_es_%.zig: $(REGISTRY)
	$(GENERATOR) $(REGISTRY) $@ GL_ES_VERSION_$(subst exports/gl_es_,,$(subst v,_,${@:.zig=})) $(EXTENSIONS)
	zig fmt $@
	zig test $@
