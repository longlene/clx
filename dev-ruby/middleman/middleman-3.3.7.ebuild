# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A static site generator"
HOMEPAGE="http://middlemanapp.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/middleman-core-3.3.7"
ruby_add_rdepend ">=dev-ruby/middleman-sprockets-3.1.2"
ruby_add_rdepend ">=dev-ruby/haml-4.0.5"
ruby_add_rdepend ">=dev-ruby/sass-3.4.0"
ruby_add_rdepend ">=dev-ruby/compass-import-once-1.0.5"
ruby_add_rdepend ">=dev-ruby/compass-1.0.0"
ruby_add_rdepend ">=dev-ruby/uglifier-2.5"
ruby_add_rdepend ">=dev-ruby/coffee-script-2.2"
ruby_add_rdepend ">=dev-ruby/execjs-2.0"
ruby_add_rdepend ">=dev-ruby/kramdown-1.2"

