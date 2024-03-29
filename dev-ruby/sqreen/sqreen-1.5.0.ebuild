# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Sqreen is a SaaS based Application protection and monitoring platform that integrates directly into your Ruby applications"
HOMEPAGE="https://www.sqreen.io/"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/execjs-0.3.0"
ruby_add_rdepend ">=dev-ruby/therubyracer-0"

