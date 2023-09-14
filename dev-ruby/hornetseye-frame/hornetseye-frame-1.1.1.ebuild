# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This Ruby extension provides conversions for compressed colourspaces"
HOMEPAGE="http://wedesoft.github.com/hornetseye-frame/"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/malloc-1.5"
ruby_add_rdepend ">=dev-ruby/multiarray-1.0"

