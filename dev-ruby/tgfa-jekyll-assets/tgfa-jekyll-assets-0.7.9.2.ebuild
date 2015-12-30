# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="  Jekyll plugin, that allows you to write javascript/css assets in
  other languages such as CoffeeScript, Sass, Less and ERB, concatenate
  them, respecting dependencies, minify and many more"
HOMEPAGE="https://github.com/tgfa/tgfa-jekyll-assets"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jekyll-1.3.1"
ruby_add_rdepend ">=dev-ruby/sprockets-2.10"
ruby_add_rdepend ">=dev-ruby/sass-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/compass-0"
ruby_add_rdepend ">=dev-ruby/bourbon-0"
ruby_add_rdepend ">=dev-ruby/neat-0"
ruby_add_rdepend ">=dev-ruby/bootstrap-sass-0"
ruby_add_rdepend ">=dev-ruby/font-awesome-sass-0"
ruby_add_rdepend ">=dev-ruby/sass-3.2.13"

