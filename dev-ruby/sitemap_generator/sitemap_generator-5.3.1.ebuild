# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="SitemapGenerator is a framework-agnostic XML Sitemap generator written in Ruby with automatic Rails integration"
HOMEPAGE="http://github.com/kjvarga/sitemap_generator"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/builder-3.0"
ruby_add_rdepend ">=dev-ruby/fog-aws-1.2"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.6"
ruby_add_rdepend ">=dev-ruby/rspec-3.5"
ruby_add_rdepend ">=dev-ruby/webmock-2.3"
ruby_add_rdepend ">=dev-ruby/rake-12"

