# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Allows you to issue requests with the OAuth gem using em-http-request"
HOMEPAGE="http://github.com/draconis/em-http-oauth-request"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/oauth-0.3.6"
ruby_add_rdepend ">=dev-ruby/em-http-request-0.2.5"
ruby_add_rdepend ">=dev-ruby/hoe-2.4.0"

