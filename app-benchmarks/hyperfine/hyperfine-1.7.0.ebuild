# Copyright 2019 Heinrich Kruger
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

CRATES="
aho-corasick-0.7.6
ansi_term-0.11.0
approx-0.1.1
approx-0.3.2
atty-0.2.13
autocfg-0.1.6
bitflags-1.1.0
bstr-0.2.8
byteorder-1.3.2
cfg-if-0.1.9
cgmath-0.16.1
clap-2.33.0
clicolors-control-1.0.1
cloudabi-0.0.3
colored-1.8.0
console-0.8.0
csv-1.1.1
csv-core-0.1.6
encode_unicode-0.3.6
fuchsia-cprng-0.1.1
hyperfine-1.7.0
indicatif-0.11.0
itoa-0.4.4
kernel32-sys-0.2.2
lazy_static-1.4.0
libc-0.2.62
lock_api-0.3.1
memchr-2.2.1
num-0.2.0
num-bigint-0.2.2
num-complex-0.2.3
num-integer-0.1.41
num-iter-0.1.39
num-rational-0.2.2
num-traits-0.1.43
num-traits-0.2.8
number_prefix-0.2.8
parking_lot-0.9.0
parking_lot_core-0.6.2
proc-macro2-1.0.2
quote-1.0.2
rand-0.4.6
rand-0.6.5
rand_chacha-0.1.1
rand_core-0.3.1
rand_core-0.4.2
rand_hc-0.1.0
rand_isaac-0.1.1
rand_jitter-0.1.4
rand_os-0.1.3
rand_pcg-0.1.2
rand_xorshift-0.1.1
rdrand-0.4.0
redox_syscall-0.1.56
regex-1.2.1
regex-automata-0.1.8
regex-syntax-0.6.11
rgb-0.8.14
rust_decimal-1.0.3
rustc_version-0.2.3
ryu-1.0.0
scopeguard-1.0.0
semver-0.9.0
semver-parser-0.7.0
serde-1.0.99
serde_derive-1.0.99
serde_json-1.0.40
smallvec-0.6.10
statistical-1.0.0
strsim-0.8.0
syn-1.0.5
term_size-0.3.1
termios-0.3.1
textwrap-0.11.0
thread_local-0.3.6
unicode-width-0.1.6
unicode-xid-0.2.0
winapi-0.2.8
winapi-0.3.8
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
winconsole-0.10.0
"

DESCRIPTION="A command-line benchmarking tool"
HOMEPAGE="https://github.com/sharkdp/hyperfine"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""
BDEPEND=">=virtual/rust-1.31.0"

src_install() {
	cargo_src_install --path="."

	insinto /usr/share/hyperfine/scripts
	doins -r scripts/*

	einstalldocs
}
