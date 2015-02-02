all: libmp4fetch.dylib main

libmp4fetch.dylib: *.c
	gcc -std=c99 -shared -fPIC -o libmp4fetch.dylib generate.c m4u8_ts_maker.c mp4u8_index.c mpegts_muxer.c netutil.c common/byte_stream.c -I. -I./common -I/usr/local/include -L/usr/local/lib -lcstl

main: libmp4fetch.dylib
	gcc -std=c99 -o main main.c -L. -lmp4fetch
