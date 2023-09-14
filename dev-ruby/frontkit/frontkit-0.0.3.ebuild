# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A static site generator"
HOMEPAGE="http://middlemanapp.com"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/middleman-core-3.3.6"
ruby_add_rdepend ">=dev-ruby/middleman-sprockets-3.1.2"
ruby_add_rdepend ">=dev-ruby/middleman-livereload-3.3.4"
ruby_add_rdepend ">=dev-ruby/middleman-imageoptim-0.1.4"
ruby_add_rdepend ">=dev-ruby/middleman-autoprefixer-2.2.1"
ruby_add_rdepend ">=dev-ruby/middleman-minify-html-3.4.0"
ruby_add_rdepend ">=dev-ruby/middleman-deploy-0.3.0"
ruby_add_rdepend ">=dev-ruby/coffee-script-2.2"
ruby_add_rdepend ">=dev-ruby/execjs-2.0"
ruby_add_rdepend ">=dev-ruby/kramdown-1.2"
ruby_add_rdepend ">=dev-ruby/haml-4.0.5"
ruby_add_rdepend ">=dev-ruby/sass-3.4.0"
ruby_add_rdepend ">=dev-ruby/uglifier-2.5"

