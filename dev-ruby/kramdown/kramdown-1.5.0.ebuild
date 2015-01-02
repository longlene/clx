# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="kramdown is yet-another-markdown-parser but fast, pure Ruby,
using a strict syntax definition and supporting several common extensions"
HOMEPAGE="http://kramdown.gettalong.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/minitest-5.0"
ruby_add_rdepend ">=dev-ruby/coderay-1.0.0"
ruby_add_rdepend ">=dev-ruby/rouge-1.7"
ruby_add_rdepend ">=dev-ruby/stringex-1.5.1"
ruby_add_rdepend ">=dev-ruby/prawn-0.13"
ruby_add_rdepend ">=dev-ruby/ritex-1.0"
ruby_add_rdepend ">=dev-ruby/itextomml-1.5"

