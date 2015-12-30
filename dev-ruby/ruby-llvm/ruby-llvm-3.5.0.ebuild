# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=""

inherit ruby-fakegem

DESCRIPTION="Ruby-LLVM is a Ruby language binding to the LLVM compiler infrastructure library"
HOMEPAGE="http://github.com/ruby-llvm/ruby-llvm"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/ffi-1.9.3"
ruby_add_rdepend ">=dev-ruby/minitest-5.3.4"
ruby_add_rdepend ">=dev-ruby/ffi_gen-1.1.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/yard-0.8.3"

