# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="  Jekyll plugin, that allows you to write javascript/css assets in
  other languages such as CoffeeScript, Sass, Less and ERB, concatenate
  them, respecting dependencies, minify and many more"
HOMEPAGE="http://ixti.github.com/jekyll-assets"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jekyll-2.0"
ruby_add_rdepend ">=dev-ruby/sprockets-2.10"
ruby_add_rdepend ">=dev-ruby/sprockets-sass-0"
ruby_add_rdepend ">=dev-ruby/sprockets-helpers-0"
ruby_add_rdepend ">=dev-ruby/sass-3.2"
ruby_add_rdepend ">=dev-ruby/bundler-1.6"

