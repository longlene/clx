# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="An FTP client designed to work well with EventMachine"
HOMEPAGE=""

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/eventmachine-0"
ruby_add_rdepend ">=dev-ruby/net-ftp-list-0"
ruby_add_rdepend ">=dev-ruby/shoulda-0"
ruby_add_rdepend ">=dev-ruby/mocha-0"
ruby_add_rdepend ">=dev-ruby/redgreen-0"
ruby_add_rdepend ">=dev-ruby/rake-0"

