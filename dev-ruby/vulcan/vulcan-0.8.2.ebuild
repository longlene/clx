# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Build software in the cloud"
HOMEPAGE="https://github.com/heroku/vulcan"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/heroku-2.26.0"
ruby_add_rdepend ">=dev-ruby/multipart-post-1.2.0"
ruby_add_rdepend ">=dev-ruby/rest-client-1.6.7"
ruby_add_rdepend ">=dev-ruby/thor-0.14.6"

