# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://github.com/gjtorikian/jekyll-github-pages-search"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jekyll-0"
ruby_add_rdepend ">=dev-ruby/uglifier-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.13.0"
ruby_add_rdepend ">=dev-ruby/rake-0"

