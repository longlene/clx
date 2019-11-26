# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby on Rails 微信企业版本，应答API集成"
HOMEPAGE="https://github.com/lanrion/qy_wechat"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/railties-3.1"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.6.1"
ruby_add_rdepend ">=dev-ruby/rails-3.1"
ruby_add_rdepend ">=dev-ruby/multi_xml-0.5.2"
ruby_add_rdepend ">=dev-ruby/roxml-0"

