# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Bindings to libpcap via FFI interface in Ruby"
HOMEPAGE="https://github.com/sophsec/ffi-pcap"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-1.0"
ruby_add_rdepend ">=dev-ruby/ffi_dry-0.1.12"
ruby_add_rdepend ">=dev-ruby/rubygems-tasks-0.2"
ruby_add_rdepend ">=dev-ruby/rspec-2.0"
ruby_add_rdepend ">=dev-ruby/yard-0.8"

