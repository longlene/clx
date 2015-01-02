# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.markdown"
RUBY_FAKEGEM_GEMSPEC=""

inherit ruby-fakegem

DESCRIPTION="Compass is a Sass-based Stylesheet Framework that streamlines the creation and maintenance of CSS"
HOMEPAGE="http://compass-style.org"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sass-3.2.19"
ruby_add_rdepend ">=dev-ruby/chunky_png-1.2"
ruby_add_rdepend ">=dev-ruby/fssm-0.2.7"

