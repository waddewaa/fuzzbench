#!/bin/bash -ex
# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cd re2
git checkout 499ef7eff7455ce9c9fae86111d4a77b6ac335de
make -j $(nproc)
wget https://raw.githubusercontent.com/waddewaa/FennecFuzz/master/benchmark/fennecfuzz_noBB.h -O $SRC/antifuzz.h



$CXX $CXXFLAGS $SRC/target.cc -I . obj/libre2.a -lpthread $FUZZER_LIB \
    -o $OUT/fuzzer
