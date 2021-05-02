# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="kafka-rb allows you to produce and consume messages using the Kafka distributed publish/subscribe messaging service"
HOMEPAGE="http://github.com/acrosa/kafka-rb"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


