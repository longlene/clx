# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    The scrypt key derivation function is designed to be far
    more secure against hardware brute-force attacks than
    alternative functions such as PBKDF2 or bcrypt"
HOMEPAGE="https://github.com/pbhogan/scrypt"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-compiler-0.0.2"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/rdoc-0"
ruby_add_rdepend ">=dev-ruby/awesome_print-0"

