# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#CMAKE_MAKEFILE_GENERATOR="ninja"

inherit cmake toolchain-funcs vcs-snapshot

DESCRIPTION="An OSS column-oriented database management system for real-time data analysis"
HOMEPAGE="https://clickhouse.yandex"
LICENSE="Apache-2.0"

MY_PN="ClickHouse"
TYPE="stable"

SRC_URI="
	https://github.com/ClickHouse/${MY_PN}/archive/v${PV}-${TYPE}.tar.gz -> ${P}.tar.gz
	https://github.com/ClickHouse/AMQP-CPP/archive/818c2d8ad96a08a5d20fece7d1e1e8855a2b0860.tar.gz -> AMQP-CPP-818c2d8ad96a08a5d20fece7d1e1e8855a2b0860.tar.gz
	https://github.com/ClickHouse/NuRaft/archive/afc36dfa9b0beb45bc4cd935060631cc80ba04a5.tar.gz -> NuRaft-afc36dfa9b0beb45bc4cd935060631cc80ba04a5.tar.gz
	https://github.com/abseil/abseil-cpp/archive/215105818dfde3174fe799600bb0f3cae233d0bf.tar.gz -> abseil-cpp-215105818dfde3174fe799600bb0f3cae233d0bf.tar.gz
	https://github.com/ClickHouse/annoy/archive/f2ac8e7b48f9a9cf676d3b58286e5455aba8e956.tar.gz -> annoy-f2ac8e7b48f9a9cf676d3b58286e5455aba8e956.tar.gz
	https://github.com/ClickHouse/arrow/archive/d03245f801f798c63ee9a7d2b8914a9e5c5cd666.tar.gz -> arrow-d03245f801f798c63ee9a7d2b8914a9e5c5cd666.tar.gz
	https://github.com/ClickHouse/avro/archive/7832659ec986075d560f930c288e973c64679552.tar.gz -> avro-7832659ec986075d560f930c288e973c64679552.tar.gz
	https://github.com/ClickHouse/aws-sdk-cpp/archive/4a12641211d4dbc8e2fdb2dd0f1eea0927db9252.tar.gz -> aws-4a12641211d4dbc8e2fdb2dd0f1eea0927db9252.tar.gz
	https://github.com/awslabs/aws-c-auth/archive/30df6c407e2df43bd244e2c34c9b4a4b87372bfb.tar.gz -> aws-c-auth-30df6c407e2df43bd244e2c34c9b4a4b87372bfb.tar.gz
	https://github.com/ClickHouse/aws-c-cal/archive/85dd7664b786a389c6fb1a6f031ab4bb2282133d.tar.gz -> aws-c-cal-85dd7664b786a389c6fb1a6f031ab4bb2282133d.tar.gz
	https://github.com/ClickHouse/aws-c-common/archive/324fd1d973ccb25c813aa747bf1759cfde5121c5.tar.gz -> aws-c-common-324fd1d973ccb25c813aa747bf1759cfde5121c5.tar.gz
	https://github.com/awslabs/aws-c-compression/archive/b517b7decd0dac30be2162f5186c250221c53aff.tar.gz -> aws-c-compression-b517b7decd0dac30be2162f5186c250221c53aff.tar.gz
	https://github.com/awslabs/aws-c-event-stream/archive/39bfa94a14b7126bf0c1330286ef8db452d87e66.tar.gz -> aws-c-event-stream-39bfa94a14b7126bf0c1330286ef8db452d87e66.tar.gz
	https://github.com/awslabs/aws-c-http/archive/2c5a2a7d5556600b9782ffa6c9d7e09964df1abc.tar.gz -> aws-c-http-2c5a2a7d5556600b9782ffa6c9d7e09964df1abc.tar.gz
	https://github.com/ClickHouse/aws-c-io/archive/5d32c453560d0823df521a686bf7fbacde7f9be3.tar.gz -> aws-c-io-5d32c453560d0823df521a686bf7fbacde7f9be3.tar.gz
	https://github.com/awslabs/aws-c-mqtt/archive/882c689561a3db1466330ccfe3b63637e0a575d3.tar.gz -> aws-c-mqtt-882c689561a3db1466330ccfe3b63637e0a575d3.tar.gz
	https://github.com/awslabs/aws-c-s3/archive/a41255ece72a7c887bba7f9d998ca3e14f4c8a1b.tar.gz -> aws-c-s3-a41255ece72a7c887bba7f9d998ca3e14f4c8a1b.tar.gz
	https://github.com/awslabs/aws-c-sdkutils/archive/25bf5cf225f977c3accc6a05a0a7a181ef2a4a30.tar.gz -> aws-c-sdkutils-25bf5cf225f977c3accc6a05a0a7a181ef2a4a30.tar.gz
	https://github.com/awslabs/aws-checksums/archive/48e7c0e01479232f225c8044d76c84e74192889d.tar.gz -> aws-checksums-48e7c0e01479232f225c8044d76c84e74192889d.tar.gz
	https://github.com/ClickHouse/aws-crt-cpp/archive/ec0bea288f451d884c0d80d534bc5c66241c39a4.tar.gz -> aws-crt-cpp-ec0bea288f451d884c0d80d534bc5c66241c39a4.tar.gz
	https://github.com/ClickHouse/s2n-tls/archive/0f1ba9e5c4a67cb3898de0c0b4f911d4194dc8de.tar.gz -> aws-s2n-tls-0f1ba9e5c4a67cb3898de0c0b4f911d4194dc8de.tar.gz
	https://github.com/ClickHouse/azure-sdk-for-cpp/archive/ea8c3044f43f5afa7016d2d580ed201f495d7e94.tar.gz -> azure-ea8c3044f43f5afa7016d2d580ed201f495d7e94.tar.gz
	https://github.com/ClickHouse/Turbo-Base64/archive/9499e0c4945589973b9ea1bc927377cfbc84aa46.tar.gz -> base64-9499e0c4945589973b9ea1bc927377cfbc84aa46.tar.gz
	https://github.com/ClickHouse/boost/archive/03d9ec9cd159d14bd0b17c05138098451a1ea606.tar.gz -> boost-03d9ec9cd159d14bd0b17c05138098451a1ea606.tar.gz
	https://github.com/ClickHouse/boringssl/archive/8061ac62d67953e61b793042e33baf1352e67510.tar.gz -> boringssl-8061ac62d67953e61b793042e33baf1352e67510.tar.gz
	https://github.com/google/brotli/archive/63be8a99401992075c23e99f7c84de1c653e39e2.tar.gz -> brotli-63be8a99401992075c23e99f7c84de1c653e39e2.tar.gz
	https://github.com/ClickHouse/bzip2/archive/bf905ea2251191ff9911ae7ec0cfc35d41f9f7f6.tar.gz -> bzip2-bf905ea2251191ff9911ae7ec0cfc35d41f9f7f6.tar.gz
	https://github.com/ClickHouse/c-ares/archive/afee6748b0b99acf4509d42fa37ac8422262f91b.tar.gz -> c-ares-afee6748b0b99acf4509d42fa37ac8422262f91b.tar.gz
	https://github.com/capnproto/capnproto/archive/2e88221d3dde22266bfccf40eaee6ff9b40d113d.tar.gz -> capnproto-2e88221d3dde22266bfccf40eaee6ff9b40d113d.tar.gz
	https://github.com/ClickHouse/cpp-driver/archive/f4a31e92a25c34c02c7291ff97c7813bc83b0e09.tar.gz -> cassandra-f4a31e92a25c34c02c7291ff97c7813bc83b0e09.tar.gz
	https://github.com/ClickHouse/cctz/archive/7c78edd52b4d65acc103c2f195818ffcabe6fe0d.tar.gz -> cctz-7c78edd52b4d65acc103c2f195818ffcabe6fe0d.tar.gz
	https://github.com/ClickHouse/cld2/archive/bc6d493a2f64ed1fc1c4c4b4294a542a04e04217.tar.gz -> cld2-bc6d493a2f64ed1fc1c4c4b4294a542a04e04217.tar.gz
	https://github.com/corrosion-rs/corrosion/archive/d9dfdefaa3d9ec4ba1245c7070727359c65c7869.tar.gz -> corrosion-d9dfdefaa3d9ec4ba1245c7070727359c65c7869.tar.gz
	https://github.com/mfontanini/cppkafka/archive/5a119f689f8a4d90d10a9635e7ee2bee5c127de1.tar.gz -> cppkafka-5a119f689f8a4d90d10a9635e7ee2bee5c127de1.tar.gz
	https://github.com/linux-on-ibm-z/crc32-s390x/archive/30980583bf9ed3fa193abb83a1849705ff457f70.tar.gz -> crc32-s390x-30980583bf9ed3fa193abb83a1849705ff457f70.tar.gz
	https://github.com/antonblanchard/crc32-vpmsum/archive/452155439389311fc7d143621eaf56a258e02476.tar.gz -> crc32-vpmsum-452155439389311fc7d143621eaf56a258e02476.tar.gz
	https://github.com/RoaringBitmap/CRoaring/archive/2c867e9f9c9e2a3a7032791f94c4c7ae3013f6e0.tar.gz -> croaring-2c867e9f9c9e2a3a7032791f94c4c7ae3013f6e0.tar.gz
	https://github.com/curl/curl/archive/462196e6b4a47f924293a0e26b8e9c23d37ac26f.tar.gz -> curl-462196e6b4a47f924293a0e26b8e9c23d37ac26f.tar.gz
	https://github.com/ClickHouse/cyrus-sasl/archive/e6466edfd638cc5073debe941c53345b18a09512.tar.gz -> cyrus-sasl-e6466edfd638cc5073debe941c53345b18a09512.tar.gz
	https://github.com/ClickHouse/datasketches-cpp/archive/7abd49bb2e72bf9a5029993d31dcb1872da88292.tar.gz -> datasketches-cpp-7abd49bb2e72bf9a5029993d31dcb1872da88292.tar.gz
	https://github.com/google/double-conversion/archive/cf2f0f3d547dc73b4612028a155b80536902ba02.tar.gz -> double-conversion-cf2f0f3d547dc73b4612028a155b80536902ba02.tar.gz
	https://github.com/ClickHouse/dragonbox/archive/923705af6fd953aa948fc175f6020b15f7359838.tar.gz -> dragonbox-923705af6fd953aa948fc175f6020b15f7359838.tar.gz
	https://github.com/fastfloat/fast_float/archive/7eae925b51fd0f570ccd5c880c12e3e27a23b86f.tar.gz -> fast_float-7eae925b51fd0f570ccd5c880c12e3e27a23b86f.tar.gz
	https://github.com/ClickHouse/fastops/archive/1460583af7d13c0e980ce46aec8ee9400314669a.tar.gz -> fastops-1460583af7d13c0e980ce46aec8ee9400314669a.tar.gz
	https://github.com/ClickHouse/flatbuffers/archive/eb3f827948241ce0e701516f16cd67324802bce9.tar.gz -> flatbuffers-eb3f827948241ce0e701516f16cd67324802bce9.tar.gz
	https://github.com/fmtlib/fmt/archive/b6f4ceaed0a0a24ccf575fab6c56dd50ccf6f1a9.tar.gz -> fmtlib-b6f4ceaed0a0a24ccf575fab6c56dd50ccf6f1a9.tar.gz
	https://github.com/google/benchmark/archive/2257fa4d6afb8e5a2ccd510a70f38fe7fcdf1edf.tar.gz -> google-benchmark-2257fa4d6afb8e5a2ccd510a70f38fe7fcdf1edf.tar.gz
	https://github.com/google/googletest/archive/71140c3ca7a87bb1b5b9c9f1500fea8858cce344.tar.gz -> googletest-71140c3ca7a87bb1b5b9c9f1500fea8858cce344.tar.gz
	https://github.com/ClickHouse/grpc/archive/3f975ecab377cd5f739af780566596128f17bb74.tar.gz -> grpc-3f975ecab377cd5f739af780566596128f17bb74.tar.gz
	https://github.com/ClickHouse/h3/archive/c7f46cfd71fb60e2fefc90e28abe81657deff735.tar.gz -> h3-c7f46cfd71fb60e2fefc90e28abe81657deff735.tar.gz
	https://github.com/schoentoon/hashidsxx/archive/783f6911ccfdaca83e3cfac084c4aad888a80cee.tar.gz -> hashidsxx-783f6911ccfdaca83e3cfac084c4aad888a80cee.tar.gz
	https://github.com/ClickHouse/hive-metastore/archive/809a77d435ce218d9b000733f19489c606fc567b.tar.gz -> hive-metastore-809a77d435ce218d9b000733f19489c606fc567b.tar.gz
	https://github.com/unicode-org/icu/archive/a56dde820dc35665a66f2e9ee8ba58e75049b668.tar.gz -> icu-a56dde820dc35665a66f2e9ee8ba58e75049b668.tar.gz
	https://github.com/ClickHouse/icudata/archive/72d9a4a7febc904e2b0a534ccb25ae40fac5f1e5.tar.gz -> icudata-72d9a4a7febc904e2b0a534ccb25ae40fac5f1e5.tar.gz
	https://github.com/jemalloc/jemalloc/archive/41a859ef7325569c6c25f92d294d45123bb81355.tar.gz -> jemalloc-41a859ef7325569c6c25f92d294d45123bb81355.tar.gz
	https://github.com/ClickHouse/krb5/archive/b89e20367b074bd02dd118a6534099b21e88b3c3.tar.gz -> krb5-b89e20367b074bd02dd118a6534099b21e88b3c3.tar.gz
	https://github.com/ClickHouse/lemmagen-c/archive/59537bdcf57bbed17913292cb4502d15657231f1.tar.gz -> lemmagen-c-59537bdcf57bbed17913292cb4502d15657231f1.tar.gz
	https://github.com/ClickHouse/libcpuid/archive/503083acb77edf9fbce22a05826307dff2ce96e6.tar.gz -> libcpuid-503083acb77edf9fbce22a05826307dff2ce96e6.tar.gz
	https://github.com/ridiculousfish/libdivide/archive/3bd34388573681ce563348cdf04fe15d24770d04.tar.gz -> libdivide-3bd34388573681ce563348cdf04fe15d24770d04.tar.gz
	https://github.com/ClickHouse/libgsasl/archive/0324680f13f22bb43df5353a08e26453d7d640ac.tar.gz -> libgsasl-0324680f13f22bb43df5353a08e26453d7d640ac.tar.gz
	https://github.com/ClickHouse/libhdfs3/archive/9194af44588633c1b2dae44bf945804401ff883e.tar.gz -> libhdfs3-9194af44588633c1b2dae44bf945804401ff883e.tar.gz
	https://github.com/ClickHouse/libpq/archive/e071ea570f8985aa00e34f5b9d50a3cfe666327e.tar.gz -> libpq-e071ea570f8985aa00e34f5b9d50a3cfe666327e.tar.gz
	https://github.com/ClickHouse/libpqxx/archive/a4e834839270a8c1f7ff1db351ba85afced3f0e2.tar.gz -> libpqxx-a4e834839270a8c1f7ff1db351ba85afced3f0e2.tar.gz
	https://github.com/google/libprotobuf-mutator/archive/a304ec48dcf15d942607032151f7e9ee504b5dcf.tar.gz -> libprotobuf-mutator-a304ec48dcf15d942607032151f7e9ee504b5dcf.tar.gz
	https://github.com/ClickHouse/librdkafka/archive/6f3b483426a8c8ec950e27e446bec175cf8b553f.tar.gz -> librdkafka-6f3b483426a8c8ec950e27e446bec175cf8b553f.tar.gz
	https://github.com/ClickHouse/libstemmer_c/archive/c753054304d87daf460057c1a649c482aa094835.tar.gz -> libstemmer_c-c753054304d87daf460057c1a649c482aa094835.tar.gz
	https://github.com/ClickHouse/libunwind/archive/5022f30f3e092a54a7c101c335ce5e08769db366.tar.gz -> libunwind-5022f30f3e092a54a7c101c335ce5e08769db366.tar.gz
	https://github.com/ClickHouse/libuv/archive/3a85b2eb3d83f369b8a8cafd329d7e9dc28f60cf.tar.gz -> libuv-3a85b2eb3d83f369b8a8cafd329d7e9dc28f60cf.tar.gz
	https://github.com/GNOME/libxml2/archive/7846b0a677f8d3ce72486125fa281e92ac9970e8.tar.gz -> libxml2-7846b0a677f8d3ce72486125fa281e92ac9970e8.tar.gz
	https://github.com/ClickHouse/llvm-project/archive/e61a81aa6fc529b469e2a54b7ce788606e138b5d.tar.gz -> llvm-project-e61a81aa6fc529b469e2a54b7ce788606e138b5d.tar.gz
	https://github.com/lz4/lz4/archive/4c9431e9af596af0556e5da0ae99305bafb2b10b.tar.gz -> lz4-4c9431e9af596af0556e5da0ae99305bafb2b10b.tar.gz
	https://github.com/Neargye/magic_enum/archive/38f86e4d093cfc9034a140d37de2168e3951bef3.tar.gz -> magic_enum-38f86e4d093cfc9034a140d37de2168e3951bef3.tar.gz
	https://github.com/ClickHouse/mariadb-connector-c/archive/e39608998f5f6944ece9ec61f48e9172ec1de660.tar.gz -> mariadb-connector-c-e39608998f5f6944ece9ec61f48e9172ec1de660.tar.gz
	https://github.com/danlark1/miniselect/archive/be0af6bd0b6eb044d1acc4f754b229972d99903a.tar.gz -> miniselect-be0af6bd0b6eb044d1acc4f754b229972d99903a.tar.gz
	https://github.com/zlib-ng/minizip-ng/archive/f3d400e999056ca290998b3fd89cc5a74e4b8b58.tar.gz -> minizip-ng-f3d400e999056ca290998b3fd89cc5a74e4b8b58.tar.gz
	https://github.com/morton-nd/morton-nd/archive/3795491a4aa3cdc916c8583094683f0d68df5bc0.tar.gz -> morton-nd-3795491a4aa3cdc916c8583094683f0d68df5bc0.tar.gz
	https://github.com/msgpack/msgpack-c/archive/46684265d50b5d1b062d4c5c428ba08462844b1d.tar.gz -> msgpack-c-46684265d50b5d1b062d4c5c428ba08462844b1d.tar.gz
	https://github.com/ClickHouse/nanodbc/archive/df52a1232dfa182f9af60974d001b91823afe9bc.tar.gz -> nanodbc-df52a1232dfa182f9af60974d001b91823afe9bc.tar.gz
	https://github.com/ClickHouse/nats.c/archive/1e2597c54616015077e53a26d56b6bac448eb1b6.tar.gz -> nats-io-1e2597c54616015077e53a26d56b6bac448eb1b6.tar.gz
	https://github.com/ClickHouse/nlp-data/archive/5591f91f5e748cba8fb9ef81564176feae774853.tar.gz -> nlp-data-5591f91f5e748cba8fb9ef81564176feae774853.tar.gz
	https://github.com/ClickHouse/openldap/archive/8688afe6bc95ebcd20edf4578c536362218cb70a.tar.gz -> openldap-8688afe6bc95ebcd20edf4578c536362218cb70a.tar.gz
	https://github.com/openssl/openssl/archive/19cc035b6c6f2283573d29c7ea7f7d675cf750ce.tar.gz -> openssl-19cc035b6c6f2283573d29c7ea7f7d675cf750ce.tar.gz
	https://github.com/ClickHouse/orc/archive/f9a393ed2433a60034795284f82d093b348f2102.tar.gz -> orc-f9a393ed2433a60034795284f82d093b348f2102.tar.gz
	https://github.com/ClickHouse/poco/archive/4b1c8dd9913d2a16db62df0e509fa598da5c8219.tar.gz -> poco-4b1c8dd9913d2a16db62df0e509fa598da5c8219.tar.gz
	https://github.com/ClickHouse/protobuf/archive/6bb70196c5360268d9f021bb7936fb0b551724c2.tar.gz -> protobuf-6bb70196c5360268d9f021bb7936fb0b551724c2.tar.gz
	https://github.com/intel/qpl/archive/becb7a1b15bdb4845ec3721a550707ffa51d029d.tar.gz -> qpl-becb7a1b15bdb4845ec3721a550707ffa51d029d.tar.gz
	https://github.com/ClickHouse/rapidjson/archive/c4ef90ccdbc21d5d5a628d08316bfd301e32d6fa.tar.gz -> rapidjson-c4ef90ccdbc21d5d5a628d08316bfd301e32d6fa.tar.gz
	https://github.com/google/re2/archive/13ebb377c6ad763ca61d12dd6f88b1126bd0b911.tar.gz -> re2-13ebb377c6ad763ca61d12dd6f88b1126bd0b911.tar.gz
	https://github.com/ClickHouse/replxx/archive/5d04501f93a4fb7f0bb8b73b8f614bc986f9e25b.tar.gz -> replxx-5d04501f93a4fb7f0bb8b73b8f614bc986f9e25b.tar.gz
	https://github.com/ClickHouse/rocksdb/archive/2c8998e26c6d46b27c710d7829c3a15e34959f70.tar.gz -> rocksdb-2c8998e26c6d46b27c710d7829c3a15e34959f70.tar.gz
	https://github.com/ClickHouse/s2geometry/archive/471fe9dc931a4bb560333545186e9b5da168ac83.tar.gz -> s2geometry-471fe9dc931a4bb560333545186e9b5da168ac83.tar.gz
	https://github.com/ClickHouse/sentry-native/archive/ae10fb8c224c3f41571446e1ed7fd57b9e5e366b.tar.gz -> sentry-native-ae10fb8c224c3f41571446e1ed7fd57b9e5e366b.tar.gz
	https://github.com/simdjson/simdjson/archive/1075e8609c4afa253162d441437af929c29e31bb.tar.gz -> simdjson-1075e8609c4afa253162d441437af929c29e31bb.tar.gz
	https://github.com/ClickHouse/snappy/archive/fb057edfed820212076239fd32cb2ff23e9016bf.tar.gz -> snappy-fb057edfed820212076239fd32cb2ff23e9016bf.tar.gz
	https://github.com/sparsehash/sparsehash-c11/archive/cf0bffaa456f23bc4174462a789b90f8b6f5f42f.tar.gz -> sparsehash-c11-cf0bffaa456f23bc4174462a789b90f8b6f5f42f.tar.gz
	https://github.com/ClickHouse/sqlite-amalgamation/archive/400ad7152a0c7ee07756d96ab4f6a8f6d1080916.tar.gz -> sqlite-amalgamation-400ad7152a0c7ee07756d96ab4f6a8f6d1080916.tar.gz
	https://github.com/ClickHouse/sysroot/archive/f0081b2649b94837855f3bc7d05ef326b100bad8.tar.gz -> sysroot-f0081b2649b94837855f3bc7d05ef326b100bad8.tar.gz
	https://github.com/apache/thrift/archive/2a93df80f27739ccabb5b885cb12a8dc7595ecdf.tar.gz -> thrift-2a93df80f27739ccabb5b885cb12a8dc7595ecdf.tar.gz
	https://github.com/ClickHouse/UnixODBC/archive/a2cd5395e8c7f7390025ec93af5bfebef3fb5fcd.tar.gz -> unixodbc-a2cd5395e8c7f7390025ec93af5bfebef3fb5fcd.tar.gz
	https://github.com/VectorCamp/vectorscan/archive/f6250ae3e5a3085000239313ad0689cc1e00cdc2.tar.gz -> vectorscan-f6250ae3e5a3085000239313ad0689cc1e00cdc2.tar.gz
	https://github.com/ClickHouse/wordnet-blast/archive/1d16ac28036e19fe8da7ba72c16a307fbdf8c87e.tar.gz -> wordnet-blast-1d16ac28036e19fe8da7ba72c16a307fbdf8c87e.tar.gz
	https://github.com/wangyi-fudan/wyhash/archive/991aa3dab624e50b066f7a02ccc9f6935cc740ec.tar.gz -> wyhash-991aa3dab624e50b066f7a02ccc9f6935cc740ec.tar.gz
	https://github.com/Cyan4973/xxHash/archive/3078dc6039f8c0bffcb1904f81cfe6b2c3209435.tar.gz -> xxHash-3078dc6039f8c0bffcb1904f81cfe6b2c3209435.tar.gz
	https://github.com/xz-mirror/xz/archive/869b9d1b4edd6df07f819d360d306251f8147353.tar.gz -> xz-869b9d1b4edd6df07f819d360d306251f8147353.tar.gz
	https://github.com/ClickHouse/yaml-cpp/archive/0c86adac6d117ee2b4afcedb8ade19036ca0327d.tar.gz -> yaml-cpp-0c86adac6d117ee2b4afcedb8ade19036ca0327d.tar.gz
	https://github.com/ClickHouse/zlib-ng/archive/50f0eae1a411764cd6d1e85b3ce471438acd3c1c.tar.gz -> zlib-ng-50f0eae1a411764cd6d1e85b3ce471438acd3c1c.tar.gz
	https://github.com/facebook/zstd/archive/b944db0c451ba1bc6bbd8e201d5f88f9041bf1f9.tar.gz -> zstd-b944db0c451ba1bc6bbd8e201d5f88f9041bf1f9.tar.gz
"

SLOT="0/${TYPE}"
IUSE="+client cpu_flags_x86_sse4_2 +server debug doc kafka mongodb mysql static test tools"
RESTRICT="!test? ( test )"
KEYWORDS="~amd64"

REQUIRED_USE="
	server? ( cpu_flags_x86_sse4_2 )
	static? ( client server tools )
"

RDEPEND="
	dev-libs/re2:0=
	!static? (
			>=app-arch/lz4-1.8.0:=
			>=app-arch/zstd-1.3.4:=
			client? (
				sys-libs/ncurses:0=
				sys-libs/readline:0=
				)

			dev-libs/double-conversion
			dev-libs/capnproto
			dev-libs/libltdl:0
			sys-libs/libunwind:0
			sys-libs/zlib
			dev-libs/poco[odbc]
			dev-libs/icu:=
			dev-libs/glib
			>=dev-libs/boost-1.65.0:=
			dev-libs/openssl:0=
			kafka? ( dev-libs/librdkafka:= )
			mysql? ( dev-db/mysql-connector-c:= )
			)

	>=dev-libs/poco-1.9.0
	dev-libs/libpcre
	dev-libs/jemalloc
"

DEPEND="${RDEPEND}
doc? ( >=dev-python/mkdocs-1.0.1 )
	static? (
			>=app-arch/lz4-1.8.0[static-libs]
			>=app-arch/zstd-1.3.4[static-libs]
			client? (
				sys-libs/ncurses:0=[static-libs]
				sys-libs/readline:0=[static-libs]
				)
			dev-libs/capnproto[static-libs]
			dev-libs/libltdl[static-libs]
			sys-libs/libunwind:0[static-libs]
			sys-libs/zlib[static-libs]
			|| (
				dev-db/unixODBC[static-libs]
				dev-libs/poco[odbc]
			   )
			dev-libs/icu[static-libs]
			dev-libs/glib[static-libs]
			>=dev-libs/boost-1.65.0[static-libs]
			dev-libs/openssl[static-libs]
			dev-db/mysql-connector-c[static-libs]
			kafka? ( dev-libs/librdkafka[static-libs] )
	)

	sys-libs/libtermcap-compat
	dev-util/patchelf
	>=sys-devel/lld-6.0.0
	>=sys-devel/gcc-7.0
	>=sys-devel/clang-6.0
	"

_clang_fullversion() {
	local ver="$1"; shift
	set -- $($(tc-getCPP "$@") -E -P - <<<"__clang_major__ __clang_minor__ __clang_patchlevel__")
	eval echo "$ver"
}

clang-fullversion() {
	_clang_fullversion '$1.$2.$3' "$@"
}

clang-version() {
	_clang_fullversion '$1.$2' "$@"
}

clang-major-version() {
	_clang_fullversion '$1' "$@"
}

clang-minor-version() {
	_clang_fullversion '$2' "$@"
}

clang-micro-version() {
	_clang_fullversion '$3' "$@"
}

pkg_pretend() {
	if [[ $(tc-getCC) == clang ]]; then
		if [[ $(clang-major-version) -lt 6 ]]; then
			eerror "Compilation with clang older than 6.0 is not supported"
				die "Too old clang found"
				fi
				:
				elif [[ $(gcc-major-version) -lt 7 ]] && [[$(gcc-minor-version) -lt 2 ]]; then
				eerror "Compilation with gcc older than 7.2 is not supported"
				die "Too old gcc found"
				fi
}

src_prepare() {
	default
	rmdir contrib/AMQP-CPP && ln -sv "${WORKDIR}"/AMQP-CPP-818c2d8ad96a08a5d20fece7d1e1e8855a2b0860 contrib/AMQP-CPP
	rmdir contrib/NuRaft && ln -sv "${WORKDIR}"/NuRaft-afc36dfa9b0beb45bc4cd935060631cc80ba04a5 contrib/NuRaft
	rmdir contrib/abseil-cpp && ln -sv "${WORKDIR}"/abseil-cpp-215105818dfde3174fe799600bb0f3cae233d0bf contrib/abseil-cpp
	rmdir contrib/annoy && ln -sv "${WORKDIR}"/annoy-f2ac8e7b48f9a9cf676d3b58286e5455aba8e956 contrib/annoy
	rmdir contrib/arrow && ln -sv "${WORKDIR}"/arrow-d03245f801f798c63ee9a7d2b8914a9e5c5cd666 contrib/arrow
	rmdir contrib/avro && ln -sv "${WORKDIR}"/avro-7832659ec986075d560f930c288e973c64679552 contrib/avro
	rmdir contrib/aws && ln -sv "${WORKDIR}"/aws-4a12641211d4dbc8e2fdb2dd0f1eea0927db9252 contrib/aws
	rmdir contrib/aws-c-auth && ln -sv "${WORKDIR}"/aws-c-auth-30df6c407e2df43bd244e2c34c9b4a4b87372bfb contrib/aws-c-auth
	rmdir contrib/aws-c-cal && ln -sv "${WORKDIR}"/aws-c-cal-85dd7664b786a389c6fb1a6f031ab4bb2282133d contrib/aws-c-cal
	rmdir contrib/aws-c-common && ln -sv "${WORKDIR}"/aws-c-common-324fd1d973ccb25c813aa747bf1759cfde5121c5 contrib/aws-c-common
	rmdir contrib/aws-c-compression && ln -sv "${WORKDIR}"/aws-c-compression-b517b7decd0dac30be2162f5186c250221c53aff contrib/aws-c-compression
	rmdir contrib/aws-c-event-stream && ln -sv "${WORKDIR}"/aws-c-event-stream-39bfa94a14b7126bf0c1330286ef8db452d87e66 contrib/aws-c-event-stream
	rmdir contrib/aws-c-http && ln -sv "${WORKDIR}"/aws-c-http-2c5a2a7d5556600b9782ffa6c9d7e09964df1abc contrib/aws-c-http
	rmdir contrib/aws-c-io && ln -sv "${WORKDIR}"/aws-c-io-5d32c453560d0823df521a686bf7fbacde7f9be3 contrib/aws-c-io
	rmdir contrib/aws-c-mqtt && ln -sv "${WORKDIR}"/aws-c-mqtt-882c689561a3db1466330ccfe3b63637e0a575d3 contrib/aws-c-mqtt
	rmdir contrib/aws-c-s3 && ln -sv "${WORKDIR}"/aws-c-s3-a41255ece72a7c887bba7f9d998ca3e14f4c8a1b contrib/aws-c-s3
	rmdir contrib/aws-c-sdkutils && ln -sv "${WORKDIR}"/aws-c-sdkutils-25bf5cf225f977c3accc6a05a0a7a181ef2a4a30 contrib/aws-c-sdkutils
	rmdir contrib/aws-checksums && ln -sv "${WORKDIR}"/aws-checksums-48e7c0e01479232f225c8044d76c84e74192889d contrib/aws-checksums
	rmdir contrib/aws-crt-cpp && ln -sv "${WORKDIR}"/aws-crt-cpp-ec0bea288f451d884c0d80d534bc5c66241c39a4 contrib/aws-crt-cpp
	rmdir contrib/aws-s2n-tls && ln -sv "${WORKDIR}"/aws-s2n-tls-0f1ba9e5c4a67cb3898de0c0b4f911d4194dc8de contrib/aws-s2n-tls
	rmdir contrib/azure && ln -sv "${WORKDIR}"/azure-ea8c3044f43f5afa7016d2d580ed201f495d7e94 contrib/azure
	rmdir contrib/base64 && ln -sv "${WORKDIR}"/base64-9499e0c4945589973b9ea1bc927377cfbc84aa46 contrib/base64
	rmdir contrib/boost && ln -sv "${WORKDIR}"/boost-03d9ec9cd159d14bd0b17c05138098451a1ea606 contrib/boost
	rmdir contrib/boringssl && ln -sv "${WORKDIR}"/boringssl-8061ac62d67953e61b793042e33baf1352e67510 contrib/boringssl
	rmdir contrib/brotli && ln -sv "${WORKDIR}"/brotli-63be8a99401992075c23e99f7c84de1c653e39e2 contrib/brotli
	rmdir contrib/bzip2 && ln -sv "${WORKDIR}"/bzip2-bf905ea2251191ff9911ae7ec0cfc35d41f9f7f6 contrib/bzip2
	rmdir contrib/c-ares && ln -sv "${WORKDIR}"/c-ares-afee6748b0b99acf4509d42fa37ac8422262f91b contrib/c-ares
	rmdir contrib/capnproto && ln -sv "${WORKDIR}"/capnproto-2e88221d3dde22266bfccf40eaee6ff9b40d113d contrib/capnproto
	rmdir contrib/cassandra && ln -sv "${WORKDIR}"/cassandra-f4a31e92a25c34c02c7291ff97c7813bc83b0e09 contrib/cassandra
	rmdir contrib/cctz && ln -sv "${WORKDIR}"/cctz-7c78edd52b4d65acc103c2f195818ffcabe6fe0d contrib/cctz
	rmdir contrib/cld2 && ln -sv "${WORKDIR}"/cld2-bc6d493a2f64ed1fc1c4c4b4294a542a04e04217 contrib/cld2
	rmdir contrib/corrosion && ln -sv "${WORKDIR}"/corrosion-d9dfdefaa3d9ec4ba1245c7070727359c65c7869 contrib/corrosion
	rmdir contrib/cppkafka && ln -sv "${WORKDIR}"/cppkafka-5a119f689f8a4d90d10a9635e7ee2bee5c127de1 contrib/cppkafka
	rmdir contrib/crc32-s390x && ln -sv "${WORKDIR}"/crc32-s390x-30980583bf9ed3fa193abb83a1849705ff457f70 contrib/crc32-s390x
	rmdir contrib/crc32-vpmsum && ln -sv "${WORKDIR}"/crc32-vpmsum-452155439389311fc7d143621eaf56a258e02476 contrib/crc32-vpmsum
	rmdir contrib/croaring && ln -sv "${WORKDIR}"/croaring-2c867e9f9c9e2a3a7032791f94c4c7ae3013f6e0 contrib/croaring
	rmdir contrib/curl && ln -sv "${WORKDIR}"/curl-462196e6b4a47f924293a0e26b8e9c23d37ac26f contrib/curl
	rmdir contrib/cyrus-sasl && ln -sv "${WORKDIR}"/cyrus-sasl-e6466edfd638cc5073debe941c53345b18a09512 contrib/cyrus-sasl
	rmdir contrib/datasketches-cpp && ln -sv "${WORKDIR}"/datasketches-cpp-7abd49bb2e72bf9a5029993d31dcb1872da88292 contrib/datasketches-cpp
	rmdir contrib/double-conversion && ln -sv "${WORKDIR}"/double-conversion-cf2f0f3d547dc73b4612028a155b80536902ba02 contrib/double-conversion
	rmdir contrib/dragonbox && ln -sv "${WORKDIR}"/dragonbox-923705af6fd953aa948fc175f6020b15f7359838 contrib/dragonbox
	rmdir contrib/fast_float && ln -sv "${WORKDIR}"/fast_float-7eae925b51fd0f570ccd5c880c12e3e27a23b86f contrib/fast_float
	rmdir contrib/fastops && ln -sv "${WORKDIR}"/fastops-1460583af7d13c0e980ce46aec8ee9400314669a contrib/fastops
	rmdir contrib/flatbuffers && ln -sv "${WORKDIR}"/flatbuffers-eb3f827948241ce0e701516f16cd67324802bce9 contrib/flatbuffers
	rmdir contrib/fmtlib && ln -sv "${WORKDIR}"/fmtlib-b6f4ceaed0a0a24ccf575fab6c56dd50ccf6f1a9 contrib/fmtlib
	rmdir contrib/google-benchmark && ln -sv "${WORKDIR}"/google-benchmark-2257fa4d6afb8e5a2ccd510a70f38fe7fcdf1edf contrib/google-benchmark
	rmdir contrib/googletest && ln -sv "${WORKDIR}"/googletest-71140c3ca7a87bb1b5b9c9f1500fea8858cce344 contrib/googletest
	rmdir contrib/grpc && ln -sv "${WORKDIR}"/grpc-3f975ecab377cd5f739af780566596128f17bb74 contrib/grpc
	rmdir contrib/h3 && ln -sv "${WORKDIR}"/h3-c7f46cfd71fb60e2fefc90e28abe81657deff735 contrib/h3
	rmdir contrib/hashidsxx && ln -sv "${WORKDIR}"/hashidsxx-783f6911ccfdaca83e3cfac084c4aad888a80cee contrib/hashidsxx
	rmdir contrib/hive-metastore && ln -sv "${WORKDIR}"/hive-metastore-809a77d435ce218d9b000733f19489c606fc567b contrib/hive-metastore
	rmdir contrib/icu && ln -sv "${WORKDIR}"/icu-a56dde820dc35665a66f2e9ee8ba58e75049b668 contrib/icu
	rmdir contrib/icudata && ln -sv "${WORKDIR}"/icudata-72d9a4a7febc904e2b0a534ccb25ae40fac5f1e5 contrib/icudata
	rmdir contrib/jemalloc && ln -sv "${WORKDIR}"/jemalloc-41a859ef7325569c6c25f92d294d45123bb81355 contrib/jemalloc
	rmdir contrib/krb5 && ln -sv "${WORKDIR}"/krb5-b89e20367b074bd02dd118a6534099b21e88b3c3 contrib/krb5
	rmdir contrib/lemmagen-c && ln -sv "${WORKDIR}"/lemmagen-c-59537bdcf57bbed17913292cb4502d15657231f1 contrib/lemmagen-c
	rmdir contrib/libcpuid && ln -sv "${WORKDIR}"/libcpuid-503083acb77edf9fbce22a05826307dff2ce96e6 contrib/libcpuid
	rmdir contrib/libdivide && ln -sv "${WORKDIR}"/libdivide-3bd34388573681ce563348cdf04fe15d24770d04 contrib/libdivide
	rmdir contrib/libgsasl && ln -sv "${WORKDIR}"/libgsasl-0324680f13f22bb43df5353a08e26453d7d640ac contrib/libgsasl
	rmdir contrib/libhdfs3 && ln -sv "${WORKDIR}"/libhdfs3-9194af44588633c1b2dae44bf945804401ff883e contrib/libhdfs3
	rmdir contrib/libpq && ln -sv "${WORKDIR}"/libpq-e071ea570f8985aa00e34f5b9d50a3cfe666327e contrib/libpq
	rmdir contrib/libpqxx && ln -sv "${WORKDIR}"/libpqxx-a4e834839270a8c1f7ff1db351ba85afced3f0e2 contrib/libpqxx
	rmdir contrib/libprotobuf-mutator && ln -sv "${WORKDIR}"/libprotobuf-mutator-a304ec48dcf15d942607032151f7e9ee504b5dcf contrib/libprotobuf-mutator
	rmdir contrib/librdkafka && ln -sv "${WORKDIR}"/librdkafka-6f3b483426a8c8ec950e27e446bec175cf8b553f contrib/librdkafka
	rmdir contrib/libstemmer_c && ln -sv "${WORKDIR}"/libstemmer_c-c753054304d87daf460057c1a649c482aa094835 contrib/libstemmer_c
	rmdir contrib/libunwind && ln -sv "${WORKDIR}"/libunwind-5022f30f3e092a54a7c101c335ce5e08769db366 contrib/libunwind
	rmdir contrib/libuv && ln -sv "${WORKDIR}"/libuv-3a85b2eb3d83f369b8a8cafd329d7e9dc28f60cf contrib/libuv
	rmdir contrib/libxml2 && ln -sv "${WORKDIR}"/libxml2-7846b0a677f8d3ce72486125fa281e92ac9970e8 contrib/libxml2
	rmdir contrib/llvm-project && ln -sv "${WORKDIR}"/llvm-project-e61a81aa6fc529b469e2a54b7ce788606e138b5d contrib/llvm-project
	rmdir contrib/lz4 && ln -sv "${WORKDIR}"/lz4-4c9431e9af596af0556e5da0ae99305bafb2b10b contrib/lz4
	rmdir contrib/magic_enum && ln -sv "${WORKDIR}"/magic_enum-38f86e4d093cfc9034a140d37de2168e3951bef3 contrib/magic_enum
	rmdir contrib/mariadb-connector-c && ln -sv "${WORKDIR}"/mariadb-connector-c-e39608998f5f6944ece9ec61f48e9172ec1de660 contrib/mariadb-connector-c
	rmdir contrib/miniselect && ln -sv "${WORKDIR}"/miniselect-be0af6bd0b6eb044d1acc4f754b229972d99903a contrib/miniselect
	rmdir contrib/minizip-ng && ln -sv "${WORKDIR}"/minizip-ng-f3d400e999056ca290998b3fd89cc5a74e4b8b58 contrib/minizip-ng
	rmdir contrib/morton-nd && ln -sv "${WORKDIR}"/morton-nd-3795491a4aa3cdc916c8583094683f0d68df5bc0 contrib/morton-nd
	rmdir contrib/msgpack-c && ln -sv "${WORKDIR}"/msgpack-c-46684265d50b5d1b062d4c5c428ba08462844b1d contrib/msgpack-c
	rmdir contrib/nanodbc && ln -sv "${WORKDIR}"/nanodbc-df52a1232dfa182f9af60974d001b91823afe9bc contrib/nanodbc
	rmdir contrib/nats-io && ln -sv "${WORKDIR}"/nats-io-1e2597c54616015077e53a26d56b6bac448eb1b6 contrib/nats-io
	rmdir contrib/nlp-data && ln -sv "${WORKDIR}"/nlp-data-5591f91f5e748cba8fb9ef81564176feae774853 contrib/nlp-data
	rmdir contrib/openldap && ln -sv "${WORKDIR}"/openldap-8688afe6bc95ebcd20edf4578c536362218cb70a contrib/openldap
	rmdir contrib/openssl && ln -sv "${WORKDIR}"/openssl-19cc035b6c6f2283573d29c7ea7f7d675cf750ce contrib/openssl
	rmdir contrib/orc && ln -sv "${WORKDIR}"/orc-f9a393ed2433a60034795284f82d093b348f2102 contrib/orc
	rmdir contrib/poco && ln -sv "${WORKDIR}"/poco-4b1c8dd9913d2a16db62df0e509fa598da5c8219 contrib/poco
	rmdir contrib/protobuf && ln -sv "${WORKDIR}"/protobuf-6bb70196c5360268d9f021bb7936fb0b551724c2 contrib/protobuf
	rmdir contrib/qpl && ln -sv "${WORKDIR}"/qpl-becb7a1b15bdb4845ec3721a550707ffa51d029d contrib/qpl
	rmdir contrib/rapidjson && ln -sv "${WORKDIR}"/rapidjson-c4ef90ccdbc21d5d5a628d08316bfd301e32d6fa contrib/rapidjson
	rmdir contrib/re2 && ln -sv "${WORKDIR}"/re2-13ebb377c6ad763ca61d12dd6f88b1126bd0b911 contrib/re2
	rmdir contrib/replxx && ln -sv "${WORKDIR}"/replxx-5d04501f93a4fb7f0bb8b73b8f614bc986f9e25b contrib/replxx
	rmdir contrib/rocksdb && ln -sv "${WORKDIR}"/rocksdb-2c8998e26c6d46b27c710d7829c3a15e34959f70 contrib/rocksdb
	rmdir contrib/s2geometry && ln -sv "${WORKDIR}"/s2geometry-471fe9dc931a4bb560333545186e9b5da168ac83 contrib/s2geometry
	rmdir contrib/sentry-native && ln -sv "${WORKDIR}"/sentry-native-ae10fb8c224c3f41571446e1ed7fd57b9e5e366b contrib/sentry-native
	rmdir contrib/simdjson && ln -sv "${WORKDIR}"/simdjson-1075e8609c4afa253162d441437af929c29e31bb contrib/simdjson
	rmdir contrib/snappy && ln -sv "${WORKDIR}"/snappy-fb057edfed820212076239fd32cb2ff23e9016bf contrib/snappy
	rmdir contrib/sparsehash-c11 && ln -sv "${WORKDIR}"/sparsehash-c11-cf0bffaa456f23bc4174462a789b90f8b6f5f42f contrib/sparsehash-c11
	rmdir contrib/sqlite-amalgamation && ln -sv "${WORKDIR}"/sqlite-amalgamation-400ad7152a0c7ee07756d96ab4f6a8f6d1080916 contrib/sqlite-amalgamation
	rmdir contrib/sysroot && ln -sv "${WORKDIR}"/sysroot-f0081b2649b94837855f3bc7d05ef326b100bad8 contrib/sysroot
	rmdir contrib/thrift && ln -sv "${WORKDIR}"/thrift-2a93df80f27739ccabb5b885cb12a8dc7595ecdf contrib/thrift
	rmdir contrib/unixodbc && ln -sv "${WORKDIR}"/unixodbc-a2cd5395e8c7f7390025ec93af5bfebef3fb5fcd contrib/unixodbc
	rmdir contrib/vectorscan && ln -sv "${WORKDIR}"/vectorscan-f6250ae3e5a3085000239313ad0689cc1e00cdc2 contrib/vectorscan
	rmdir contrib/wordnet-blast && ln -sv "${WORKDIR}"/wordnet-blast-1d16ac28036e19fe8da7ba72c16a307fbdf8c87e contrib/wordnet-blast
	rmdir contrib/wyhash && ln -sv "${WORKDIR}"/wyhash-991aa3dab624e50b066f7a02ccc9f6935cc740ec contrib/wyhash
	rmdir contrib/xxHash && ln -sv "${WORKDIR}"/xxHash-3078dc6039f8c0bffcb1904f81cfe6b2c3209435 contrib/xxHash
	rmdir contrib/xz && ln -sv "${WORKDIR}"/xz-869b9d1b4edd6df07f819d360d306251f8147353 contrib/xz
	rmdir contrib/yaml-cpp && ln -sv "${WORKDIR}"/yaml-cpp-0c86adac6d117ee2b4afcedb8ade19036ca0327d contrib/yaml-cpp
	rmdir contrib/zlib-ng && ln -sv "${WORKDIR}"/zlib-ng-50f0eae1a411764cd6d1e85b3ce471438acd3c1c contrib/zlib-ng
	rmdir contrib/zstd && ln -sv "${WORKDIR}"/zstd-b944db0c451ba1bc6bbd8e201d5f88f9041bf1f9 contrib/zstd
	cmake_src_prepare
}
src_configure() {
	local mycmakeargs=(
			-DENABLE_POCO_MONGODB="$(usex mongodb)"
			-DENABLE_RDKAFKA="$(usex kafka)"
			-DENABLE_TESTS="$(usex test)"
			-DUSE_STATIC_LIBRARIES="$(usex static)"
			-DUSE_MYSQL="$(usex mysql)"
			-DENABLE_CLICKHOUSE_SERVER="$(usex server)"
			-DENABLE_CLICKHOUSE_CLIENT="$(usex client)"
			-DENABLE_CLICKHOUSE_LOCAL="$(usex tools)"
			-DENABLE_CLICKHOUSE_BENCHMARK="$(usex tools)"
			-DENABLE_CLICKHOUSE_PERFORMANCE="$(usex tools)"
			-DENABLE_CLICKHOUSE_EXTRACT_FROM_CONFIG="$(usex tools)"
			-DENABLE_CLICKHOUSE_COMPRESSOR="$(usex tools)"
			-DENABLE_CLICKHOUSE_COPIER="$(usex tools)"
# As of now, clickhouse fails to build if odbc is disabled
			-DENABLE_ODBC=True
			-DENABLE_CLICKHOUSE_ODBC_BRIDGE=True
			-DENABLE_CLICKHOUSE_ALL=OFF
			-DUSE_INTERNAL_SSL_LIBRARY=False
			-DUSE_INTERNAL_CITYHASH_LIBRARY=ON # Clickhouse explicitly requires bundled patched cityhash
			-DUNBUNDLED=ON
			)

			cmake_src_configure
}

src_install() {
	cmake_src_install

	if ! use test; then
		rm -rf "${D}/usr/share/clickhouse-test" || die "failed to remove tests"
	fi

	if use doc; then
		pushd "${S}/docs/tools" || die "Failed to enter docs build directory"
		./build.py || die "Failed to build docs"
		popd || die "Failed to exit docs build directory"

		dodoc -r "${S}/docs/build"
	fi

	if use server; then
		newinitd "${FILESDIR}"/clickhouse-server.initd clickhouse-server
		systemd_dounit "${FILESDIR}"/clickhouse-server.service
	fi

	keepdir /var/log/clickhouse-server
	chown clickhouse:clickhouse "${D}"/var/log/clickhouse-server
}

pkg_preinst() {
	if use server; then
		enewgroup clickhouse
		enewuser clickhouse -1 -1 /var/lib/clickhouse clickhouse
	fi
}

