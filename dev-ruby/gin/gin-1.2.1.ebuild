# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Gin is a small Ruby web framework, built on Rack, which borrows from
Sinatra expressiveness, and targets larger applications"
HOMEPAGE="http://yaks.me/gin"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-1.1"
ruby_add_rdepend ">=dev-ruby/rack-protection-1.0"
ruby_add_rdepend ">=dev-ruby/tilt-1.4"

