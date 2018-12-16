# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Net::SSH: a pure-Ruby implementation of the SSH2 client protocol"
HOMEPAGE="https://github.com/net-ssh/net-ssh"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rbnacl-libsodium-1.0.11"
ruby_add_rdepend ">=dev-ruby/rbnacl-3.2.0"
ruby_add_rdepend ">=dev-ruby/bcrypt_pbkdf-1.0"
