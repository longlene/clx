# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="使用 Markdown 编写书籍内容，通过 burr 将其转换成 PDF，ePub 和 Mobi 格式电子书。"
HOMEPAGE="https://github.com/AndorChen/burr"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/eeepub-0.8.1"
ruby_add_rdepend ">=dev-ruby/kramdown-1.3.3"
ruby_add_rdepend ">=dev-ruby/liquid-2.6.1"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.6.0"
ruby_add_rdepend ">=dev-ruby/rouge-1.3.3"
ruby_add_rdepend ">=dev-ruby/thor-0.19.0"

