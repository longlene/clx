# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A client library for the Kafka distributed commit log"
HOMEPAGE="https://github.com/zendesk/ruby-kafka"

LICENSE="Apache License Version 2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

