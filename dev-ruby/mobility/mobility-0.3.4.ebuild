# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Stores and retrieves localized data through attributes on a Ruby class, with flexible support for different storage strategies"
HOMEPAGE="https://github.com/shioyama/mobility"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/request_store-1.0"
ruby_add_rdepend ">=dev-ruby/i18n-0.6.10"
