# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Bootstrap the GitHub Pages Jekyll environment locally"
HOMEPAGE="https://github.com/github/pages-gem"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend "=dev-ruby/jekyll-1.5.1"
ruby_add_rdepend "=dev-ruby/jekyll-mentions-0.0.9"
ruby_add_rdepend "=dev-ruby/jekyll-redirect-from-0.3.1"
ruby_add_rdepend "=dev-ruby/jekyll-sitemap-0.3.0"
ruby_add_rdepend "=dev-ruby/jemoji-0.1.0"
ruby_add_rdepend "=dev-ruby/kramdown-1.3.1"
ruby_add_rdepend "=dev-ruby/liquid-2.5.5"
ruby_add_rdepend "=dev-ruby/maruku-0.7.0"
ruby_add_rdepend "=dev-ruby/rdiscount-2.1.7"
ruby_add_rdepend "=dev-ruby/redcarpet-2.3.0"
ruby_add_rdepend "=dev-ruby/RedCloth-4.2.9"

