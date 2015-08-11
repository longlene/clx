# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="http://github.com/benbjohnson/opus"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/prawn-0.13.0"
ruby_add_rdepend ">=dev-ruby/commander-4.1.5"
ruby_add_rdepend ">=dev-ruby/rake-10.0.3"
ruby_add_rdepend ">=dev-ruby/minitest-5.2.0"
ruby_add_rdepend ">=dev-ruby/mocha-0.14.0"

