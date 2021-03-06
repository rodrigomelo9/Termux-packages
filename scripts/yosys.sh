# Authors:
#   Unai Martinez-Corral
#
# Copyright 2020-2021 The HDL org Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0

cd $(dirname "$0")

[ ! -d yosys ] && git clone https://github.com/YosysHQ/yosys || true

cd yosys

CXX=clang++
export CFLAGS="-DS_IWRITE=S_IWUSR -DS_IREAD=S_IRUSR"
export LDFLAGS="-lstdc++ -landroid-glob -landroid-spawn"
make config-clang
make -j4 install PREFIX="$PREFIX"
