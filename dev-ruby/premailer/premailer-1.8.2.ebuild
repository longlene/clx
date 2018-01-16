# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Improve the rendering of HTML emails by making CSS inline, converting links and warning about unsupported code"
HOMEPAGE="http://premailer.dialect.ca/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/css_parser-1.3.5"
ruby_add_rdepend ">=dev-ruby/htmlentities-4.0.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-0.8.0"
ruby_add_rdepend ">=dev-ruby/hpricot-0.8.3"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.4.4"
ruby_add_rdepend ">=dev-ruby/yard-0.8.7"
ruby_add_rdepend ">=dev-ruby/redcarpet-3.0"
ruby_add_rdepend ">=dev-ruby/yard-redcarpet-ext-0.0.3"

