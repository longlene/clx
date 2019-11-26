# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="WebFont Loader gives you added control when using linked fonts via @font-face"
HOMEPAGE="http://github.com/typekit/webfontloader"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rack-1.5.1"
ruby_add_rdepend ">=dev-ruby/sinatra-1.3.4"
ruby_add_rdepend ">=dev-ruby/vegas-0.1.11"

