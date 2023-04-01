# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Kafka messaging made easy!"
HOMEPAGE="https://github.com/karafka/waterdrop"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/delivery_boy-0.2"
ruby_add_rdepend ">=dev-ruby/dry-configurable-0.7"
ruby_add_rdepend ">=dev-ruby/dry-monitor-0.1"
ruby_add_rdepend ">=dev-ruby/dry-validation-0.11"
ruby_add_rdepend ">=dev-ruby/null-logger-0"

