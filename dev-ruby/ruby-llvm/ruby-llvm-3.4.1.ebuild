# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

inherit ruby-fakegem

DESCRIPTION="Ruby-LLVM is a Ruby language binding to the LLVM compiler infrastructure library"
HOMEPAGE="http://github.com/ruby-llvm/ruby-llvm"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-1.9.3"
ruby_add_rdepend ">=dev-ruby/rake-10.0"

