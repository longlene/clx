# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC=""
RUBY_FAKEGEM_GEMSPEC=""

inherit ruby-fakegem

DESCRIPTION="GitHub Language detection"
HOMEPAGE="https://github.com/github/linguist"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/charlock_holmes-0.6.6"
ruby_add_rdepend ">=dev-ruby/escape_utils-0.2.4"
ruby_add_rdepend ">=dev-ruby/mime-types-1.19"

